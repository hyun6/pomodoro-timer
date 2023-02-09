import 'package:flutter/material.dart';
//import 'package:pomodoro_timer/counter/counter.dart';
import 'package:pomodoro_timer/l10n/l10n.dart';
import 'package:pomodoro_timer/timer/view/timer_page.dart';

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
      home: const TimerPage(),
    );
  }
}
