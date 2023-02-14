import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_timer/l10n/l10n.dart';
import 'package:pomodoro_timer/timer/view/timer_page.dart';
import 'package:pomodoro_timer/tray/cubit/tray_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

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
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: BlocProvider(
        create: (context) => TrayCubit()..init(),
        child: BlocListener<TrayCubit, TrayState>(
          listener: (context, state) {},
          child: const TimerPage(),
        ),
      ),
    );
  }
}
