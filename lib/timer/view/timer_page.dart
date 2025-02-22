import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pomodoro_timer/services/tray_service.dart';
import 'package:pomodoro_timer/settings/cubit/settings_cubit.dart';
import 'package:pomodoro_timer/timer/cubit/timer_cubit.dart';
import 'package:pomodoro_timer/timer/widget/task_name.dart';
import 'package:pomodoro_timer/timer/widget/timer_display.dart';
import 'package:process_run/process_run.dart';
import 'package:window_manager/window_manager.dart';

class TimerPage extends StatelessWidget with WindowListener {
  TimerPage({super.key}) {
    windowManager
      ..addListener(this)
      ..setPreventClose(false);
  }

  // not close app, just hide window
  @override
  void onWindowClose() {
    log('close');
    windowManager.hide();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final timerCubit = TimerCubit();
        // init tray icon click handler
        GetIt.instance<TrayService>()
          ..setLeftClickHandler(windowManager.show)
          ..setRightClickHandler(() {
            if (timerCubit.state.status == TimerStatus.running) {
              timerCubit.pause();
            } else {
              timerCubit.start();
            }
          });

        final settingsCubit = context.read<SettingsCubit>();
        final isAutoStartTaskWhenAppLaunched =
            settingsCubit.state.settings.isAutoStartTaskWhenAppLaunched;
        if (isAutoStartTaskWhenAppLaunched) {
          timerCubit.start();
        }
        return timerCubit;
      },
      child: BlocListener<TimerCubit, TimerState>(
        listenWhen: (previous, current) =>
            current.status == TimerStatus.completed,
        listener: (context, state) {
          final settingsCubit = context.read<SettingsCubit>();
          final isAutoStartTask = settingsCubit.state.settings.isAutoStartTask;
          final isAutoStartBreak =
              settingsCubit.state.settings.isAutoStartBreak;

          var skipDialog = false;
          if (state.task.name == 'break') {
            if (isAutoStartBreak) {
              context.read<TimerCubit>().start();
              skipDialog = true;
            }
            // monitor off when break
            if (settingsCubit.state.settings.isMonitorOff) {
              Shell().run('pmset displaysleepnow');
            }
          } else {
            if (isAutoStartTask) {
              context.read<TimerCubit>().start();
              skipDialog = true;
            }
          }

          if (skipDialog == true) {
            return;
          }

          showDialog<void>(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: const Text('타이머 종료'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    autofocus: true,
                    child: const Text('확인'),
                  ),
                ],
              );
            },
          );
        },
        child: const TimerView(),
      ),
    );
  }
}

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    // timerView repaint: https://bloclibrary.dev/#/flutterbloccoreconcepts?id=contextselect
    // - but same repaint occurred when this code was move to TaskNameWidget
    // - I'll take care of repaint later
    final taskName =
        context.select((TimerCubit cubit) => cubit.state.task.name);

    return Scaffold(
      appBar: AppBar(title: const Text('pomodoro_timer')),
      body: Column(
        children: [
          Flexible(
            child: TaskNameWidget(taskName: taskName),
          ),
          const Flexible(
            flex: 3,
            child: TimerDisplayWidget(),
          ),
          // buttons
          Flexible(
            child: BlocSelector<TimerCubit, TimerState, TimerStatus>(
              selector: (state) {
                return state.status;
              },
              builder: (context, status) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (status == TimerStatus.running)
                      IconButton(
                        icon: const Icon(
                          Icons.pause_circle_filled_outlined,
                          size: 50,
                        ),
                        autofocus: true,
                        onPressed: () => context.read<TimerCubit>().pause(),
                      )
                    else
                      IconButton(
                        icon: const Icon(
                          Icons.play_circle_fill_outlined,
                          size: 50,
                        ),
                        autofocus: true,
                        onPressed: () => context.read<TimerCubit>().start(),
                      ),
                    const Padding(padding: EdgeInsets.all(10)),
                    IconButton(
                      icon: const Icon(
                        Icons.stop_circle_outlined,
                        size: 50,
                      ),
                      onPressed: () => context.read<TimerCubit>().stop(),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
