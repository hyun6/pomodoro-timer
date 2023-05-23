import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_timer/app/view/platform_menu.dart';
import 'package:pomodoro_timer/l10n/l10n.dart';
import 'package:pomodoro_timer/services/material_context.dart';
import 'package:pomodoro_timer/timer/view/timer_page.dart';
import 'package:pomodoro_timer/tray/cubit/tray_cubit.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFFFFFFFF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFFEE5436),
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorKey: navigatorState,
      home: BlocProvider(
        create: (context) => TrayCubit()..init(),
        child: PlatformMenuBar(
          menus: getPlatformMenus(),
          child: TimerPage(),
        ),
      ),
    );
  }
}
