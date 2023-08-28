import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:pomodoro_timer/settings/data/settings_model.dart';

part 'settings_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit()
      : super(
          const SettingsState(
            status: SettingsStatus.loading,
            settings: SettingsModel(
              isAutoStartTask: false,
              isAutoStartBreak: false,
              isAutoStartTaskWhenAppLaunched: false,
            ),
          ),
        );

  /// 앱 실행 시 task 타이머 자동 시작
  void setAutoStartTaskWhenAppLaunched({required bool enable}) {
    emit(
      SettingsState(
        status: SettingsStatus.loaded,
        settings:
            state.settings.copyWith(isAutoStartTaskWhenAppLaunched: enable),
      ),
    );
  }

  void setAutoStartTask({required bool enable}) {
    emit(
      SettingsState(
        status: SettingsStatus.loaded,
        settings: state.settings.copyWith(isAutoStartTask: enable),
      ),
    );
  }

  void setAutoStartBreak({required bool enable}) {
    emit(
      SettingsState(
        status: SettingsStatus.loaded,
        settings: state.settings.copyWith(isAutoStartBreak: enable),
      ),
    );
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) => SettingsState(
        status: SettingsStatus.loaded,
        settings: SettingsModel(
          isAutoStartTask: json['isAutoStartTask'] as bool? ?? false,
          isAutoStartBreak: json['isAutoStartBreak'] as bool? ?? false,
          isAutoStartTaskWhenAppLaunched:
              json['isAutoStartTaskWhenAppLaunched'] as bool? ?? false,
        ),
      );

  @override
  Map<String, dynamic>? toJson(SettingsState state) => {
        'isAutoStartTask': state.settings.isAutoStartTask,
        'isAutoStartBreak': state.settings.isAutoStartBreak,
        'isAutoStartTaskWhenAppLaunched':
            state.settings.isAutoStartTaskWhenAppLaunched,
      };
}
