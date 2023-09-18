import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pomodoro_timer/services/audio_service.dart';
import 'package:pomodoro_timer/services/tray_service.dart';
import 'package:window_manager/window_manager.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      GetIt.instance.registerSingleton(AudioService());
      final trayService = TrayService();
      await trayService.init();
      GetIt.instance.registerSingleton(trayService);

      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: await getApplicationSupportDirectory(),
      );
      runApp(await builder());

      await windowManager.ensureInitialized();
      const windowOptions = WindowOptions(
        size: Size(800, 600),
        center: true,
        skipTaskbar: false,
        titleBarStyle: TitleBarStyle.normal,
      );
      await windowManager.waitUntilReadyToShow(windowOptions, () async {
        await windowManager.show();
        await windowManager.focus();
      });
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
