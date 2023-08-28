import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pomodoro_timer/settings/cubit/settings_cubit.dart';
import 'package:pomodoro_timer/settings/data/settings_model.dart';

class MockStorage extends Mock implements Storage {}

void main() {
  late Storage storage;

  setUp(() {
    storage = MockStorage();
    when(
      () => storage.write(any(), any<dynamic>()),
    ).thenAnswer((_) async {});
    HydratedBloc.storage = storage;
  });

  group('Settings', () {
    blocTest<SettingsCubit, SettingsState>(
      'emits [MyState] when MyEvent is added.',
      build: SettingsCubit.new,
      act: (cubit) => cubit.setAutoStartBreak(enable: true),
      expect: () => const SettingsState(
        status: SettingsStatus.loaded,
        settings: SettingsModel(
          isAutoStartTask: false,
          isAutoStartBreak: true,
          isAutoStartTaskWhenAppLaunched: false,
        ),
      ),
    );
  });
}
