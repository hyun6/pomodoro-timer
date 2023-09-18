import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pomodoro_timer/services/audio_service.dart';
import 'package:pomodoro_timer/settings/cubit/settings_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Settings')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CheckboxWithText(
                  text: 'auto start task when app launched',
                  value: state.settings.isAutoStartTaskWhenAppLaunched,
                  onChanged: (bool? changedValue) {
                    context
                        .read<SettingsCubit>()
                        .setAutoStartTaskWhenAppLaunched(
                          enable:
                              changedValue ?? !state.settings.isAutoStartTask,
                        );
                  },
                ),
                CheckboxWithText(
                  text: 'auto start task',
                  value: state.settings.isAutoStartTask,
                  onChanged: (bool? changedValue) {
                    context.read<SettingsCubit>().setAutoStartTask(
                          enable:
                              changedValue ?? !state.settings.isAutoStartTask,
                        );
                  },
                ),
                CheckboxWithText(
                  text: 'auto start break',
                  value: state.settings.isAutoStartBreak,
                  onChanged: (bool? changedValue) {
                    context.read<SettingsCubit>().setAutoStartBreak(
                          enable:
                              changedValue ?? !state.settings.isAutoStartBreak,
                        );
                  },
                ),
                CheckboxWithText(
                  text: 'monitor off when break start',
                  value: state.settings.isMonitorOff,
                  onChanged: (bool? changedValue) {
                    context.read<SettingsCubit>().setMonitorOff(
                          enable: changedValue ?? !state.settings.isMonitorOff,
                        );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('volume: '),
                    Slider(
                      value: state.settings.volume.toDouble(),
                      max: 100,
                      divisions: 10,
                      label: state.settings.volume.toString(),
                      onChanged: (value) {
                        context
                            .read<SettingsCubit>()
                            .setVolume(volume: value.toInt());

                        GetIt.I<AudioService>().setVolume(value / 100);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CheckboxWithText extends StatelessWidget {
  const CheckboxWithText({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  final String text;
  final bool value;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
