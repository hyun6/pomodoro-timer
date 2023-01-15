import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_timer/timer/cubit/timer_cubit.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerCubit(),
      child: const TimerView(),
    );
  }
}

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  String _durationToTimeText(int duration) {
    final min = (duration / 60).floor().toString();
    final sec = (duration % 60).toString().padLeft(2, '0');
    return '$min:$sec';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('pomodoro_timer')),
      body: Stack(
        children: [
          // BlocBuilder<TimerCubit, TimerState>(
          //   builder: (context, state) {
          //     if (state.status == TimerStatus.completed) {
          //       return [
          //         ModalBarrier(
          //           color: Colors.black.withAlpha(100),
          //         ),
          //         const AlertDialog(title: Text('굳'))
          //       ];
          //     }
          //   },
          // ),
          Column(
            children: [
              BlocSelector<TimerCubit, TimerState, int>(
                selector: (state) {
                  return state.duration;
                },
                builder: (context, duration) {
                  return Text(
                    _durationToTimeText(duration),
                    style: const TextStyle(fontSize: 40),
                  );
                },
              ),
              const Padding(padding: EdgeInsets.all(10)),
              BlocSelector<TimerCubit, TimerState, TimerStatus>(
                selector: (state) {
                  return state.status;
                },
                builder: (context, status) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (status == TimerStatus.running)
                        FloatingActionButton(
                          child: const Icon(Icons.pause),
                          onPressed: () => context.read<TimerCubit>().pause(),
                        )
                      else
                        FloatingActionButton(
                          child: const Icon(Icons.play_arrow),
                          onPressed: () => context.read<TimerCubit>().start(),
                        ),
                      const Padding(padding: EdgeInsets.all(10)),
                      FloatingActionButton(
                        child: const Icon(Icons.stop),
                        onPressed: () => context.read<TimerCubit>().stop(),
                      ),
                    ],
                  );
                },
              )
            ],
          ),

          // const Center(
          //   child: AlertDialog(
          //     title: Text('Loading...'),
          //     elevation: 0,
          //   ),
          // ),
        ],
      ),
    );
  }
}
