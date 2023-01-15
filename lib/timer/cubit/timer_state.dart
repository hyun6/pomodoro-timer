part of 'timer_cubit.dart';

enum TimerStatus {
  idle,
  running,
  paused,
}

@immutable
class TimerState {
  const TimerState(this.duration, [this.status = TimerStatus.idle]);
  final int duration;
  final TimerStatus status;
}
