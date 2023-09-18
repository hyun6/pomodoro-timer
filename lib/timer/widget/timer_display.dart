import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pomodoro_timer/services/tray_service.dart';
import 'package:pomodoro_timer/timer/cubit/timer_cubit.dart';

class TimerDisplayWidget extends StatelessWidget {
  const TimerDisplayWidget({super.key});

  String _tickToTimeText(int tick) {
    final min = (tick / 60).floor().toString();
    final sec = (tick % 60).toString().padLeft(2, '0');
    return '$min:$sec';
  }

  @override
  Widget build(BuildContext context) {
    final tick = context.select((TimerCubit cubit) => cubit.state.tick);
    GetIt.instance<TrayService>().setTitle(_tickToTimeText(tick));

    return Column(
      children: [
        const SizedBox(height: 80),
        Text(
          _tickToTimeText(tick),
          style: const TextStyle(fontSize: 40),
        ),
      ],
    );
  }
}
