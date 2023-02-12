import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_timer/timer/cubit/timer_cubit.dart';
import 'package:pomodoro_timer/timer/data/task_model.dart';
import 'package:pomodoro_timer/timer/widget/task_name.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerCubit(),
      child: BlocListener<TimerCubit, TimerState>(
        listener: (context, state) {
          if (state.status == TimerStatus.completed) {
            final timerCubit = context.read<TimerCubit>();
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

  String _tickToTimeText(int tick) {
    final min = (tick / 60).floor().toString();
    final sec = (tick % 60).toString().padLeft(2, '0');
    return '$min:$sec';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('pomodoro_timer')),
      body: Column(
        children: [
          // task name
          Flexible(
            child: BlocSelector<TimerCubit, TimerState, TaskModel>(
              selector: (state) {
                return state.task;
              },
              builder: (context, task) {
                return TaskName(taskName: task.name);
              },
            ),
          ),
          Flexible(
            flex: 3,
            child: BlocSelector<TimerCubit, TimerState, int>(
              selector: (state) {
                return state.tick;
              },
              builder: (context, tick) {
                return Column(
                  children: [
                    const SizedBox(height: 80),
                    Text(
                      _tickToTimeText(tick),
                      style: const TextStyle(fontSize: 40),
                    ),
                  ],
                );
              },
            ),
          ),
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
                        onPressed: () => context.read<TimerCubit>().pause(),
                      )
                    else
                      IconButton(
                        icon: const Icon(
                          Icons.play_circle_fill_outlined,
                          size: 50,
                        ),
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
