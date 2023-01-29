import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pomodoro_timer/services/audio.dart';
import 'package:pomodoro_timer/services/countdown.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(const TimerState(0));

  final AudioService _audioService = AudioService();
  StreamSubscription<int>? _countDownStream;
  static const int default25Min = 10; //60 * 25;
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
      _countDownStream = countDown(_durationInSecond).listen(_onCountDown);
      _audioService.stop();
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

  // count down callback listener
  void _onCountDown(int count) {
    if (count == 0) {
      _onComplete();
    } else {
      emit(TimerState(count, TimerStatus.running));
    }
  }

  void _onComplete() {
    emit(const TimerState(0, TimerStatus.completed));
    _audioService.play();
  }

  @override
  void onChange(Change<TimerState> change) {
    log('${change.currentState.status} -> ${change.nextState.status}');
    log('${change.currentState.duration} -> ${change.nextState.duration}');
    super.onChange(change);
  }
}
