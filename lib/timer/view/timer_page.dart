import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_timer/timer/cubit/timer_cubit.dart';
import 'package:pomodoro_timer/timer/widget/task_name.dart';
import 'package:pomodoro_timer/timer/widget/timer_display.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerCubit(),
      child: BlocListener<TimerCubit, TimerState>(
        listener: (context, state) {
          if (state.status == TimerStatus.completed) {
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
                    )
                  ],
                );
              },
            );
          }
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
    return Scaffold(
      appBar: AppBar(title: const Text('pomodoro_timer')),
      body: Column(
        children: [
          const Flexible(
            child: TaskNameWidget(),
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
          )
        ],
      ),
    );
  }
}
