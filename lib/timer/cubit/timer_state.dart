part of 'timer_cubit.dart';

enum TimerStatus { idle, running, paused, completed }

@immutable
class TimerState {
  const TimerState(this.task, [this.status = TimerStatus.idle, this.tick = 0]);
  final TaskModel task;
  final TimerStatus status;
  final int tick;

  TimerState copyWith({TaskModel? task, TimerStatus? status, int? tick}) =>
      TimerState(task ?? this.task, status ?? this.status, tick ?? this.tick);
}
