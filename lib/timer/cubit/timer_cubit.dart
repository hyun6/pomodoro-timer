import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pomodoro_timer/util/countdown.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(const TimerState(0));

  StreamSubscription<int>? _countDownStream;
  static const int default25Min = 60 * 25;
  final int _durationInSecond = default25Min;

  void stop() {
    if (state.status != TimerStatus.idle) {
      _countDownStream?.cancel();
    }
    emit(TimerState(_durationInSecond));
  }

  void start() {
    if (state.status == TimerStatus.idle) {
      _countDownStream?.cancel();
      _countDownStream = countDown(_durationInSecond).listen(_countDown);
    } else if (state.status == TimerStatus.paused) {
      resume();
    }
  }

  void pause() {
    if (state.status == TimerStatus.running) {
      _countDownStream?.pause();
      emit(TimerState(state.duration, TimerStatus.paused));
    }
  }

  void resume() {
    if (state.status == TimerStatus.paused) {
      _countDownStream?.resume();
    }
  }

  void _countDown(int count) {
    emit(TimerState(count, TimerStatus.running));
  }
}
