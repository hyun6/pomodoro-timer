import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_timer/timer/cubit/timer_cubit.dart';

class TaskNameWidget extends StatelessWidget {
  const TaskNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final taskName =
        context.select((TimerCubit cubit) => cubit.state.task.name);
    return Column(
      children: [
        const Text(
          'CURRENT TASK',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w200),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(taskName),
      ],
    );
  }
}
