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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocSelector<TimerCubit, TimerState, int>(
          selector: (state) {
            return state.duration;
          },
          builder: (context, duration) {
            return Text(duration.toString());
          },
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.play_arrow),
              onPressed: () => context.read<TimerCubit>().start(),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            FloatingActionButton(
              child: const Icon(Icons.pause),
              onPressed: () => context.read<TimerCubit>().pause(),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            FloatingActionButton(
              child: const Icon(Icons.stop),
              onPressed: () => context.read<TimerCubit>().stop(),
            )
          ],
        )
      ],
    );
  }
}
