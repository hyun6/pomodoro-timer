import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_timer/services/audio.dart';
import 'package:pomodoro_timer/services/countdown.dart';
import 'package:pomodoro_timer/timer/data/task_model.dart';

part 'timer_state.dart';

// todo: task feature로 따로 분리
final focusTask = TaskModel(
  name: 'focus',
  duration: const Duration(minutes: 25).inSeconds,
);
final breakTask = TaskModel(
  name: 'break',
  duration: const Duration(minutes: 5).inSeconds,
);

class TimerCubit extends Cubit<TimerState> {
  TimerCubit()
      : super(TimerState(focusTask, TimerStatus.idle, focusTask.duration));

  final AudioService _audioService = AudioService();
  StreamSubscription<int>? _countDownStream;
  TaskModel _currentTask = focusTask;

  void switchCurrentTask() {
    _currentTask = _currentTask == focusTask ? breakTask : focusTask;
  }

  void stop() {
    if (state.status != TimerStatus.idle) {
      _countDownStream?.cancel();
    }
    switchCurrentTask();
    emit(
      state.copyWith(
        task: _currentTask,
        status: TimerStatus.idle,
        tick: _currentTask.duration,
      ),
    );
  }

  void start() {
    if (state.status == TimerStatus.idle ||
        state.status == TimerStatus.completed) {
      _countDownStream?.cancel();
      emit(state.copyWith(status: TimerStatus.running));
      _countDownStream = countDown(_currentTask.duration).listen(_onCountDown);
      _audioService.stop();
    } else if (state.status == TimerStatus.paused) {
      resume();
    }
  }

  void pause() {
    if (state.status == TimerStatus.running) {
      _countDownStream?.pause();
      emit(state.copyWith(status: TimerStatus.paused));
    }
  }

  void resume() {
    if (state.status == TimerStatus.paused) {
      _countDownStream?.resume();
      emit(state.copyWith(status: TimerStatus.running));
    }
  }

  // count down callback listener
  void _onCountDown(int count) {
    if (count == 0) {
      _onComplete();
    } else {
      emit(state.copyWith(tick: count));
    }
  }

  void _onComplete() {
    // switch (focus <-> break) task
    switchCurrentTask();
    emit(
      TimerState(
        _currentTask,
        TimerStatus.completed,
        _currentTask.duration,
      ),
    );
    _audioService.play();
  }

  @override
  void onChange(Change<TimerState> change) {
    log('${change.currentState.status} -> ${change.nextState.status}');
    log('${change.currentState.tick} -> ${change.nextState.tick}');
    super.onChange(change);
  }
}
