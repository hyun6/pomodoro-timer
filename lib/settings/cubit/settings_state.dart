part of 'settings_cubit.dart';

enum SettingsStatus { loading, loaded }

@immutable
class SettingsState extends Equatable {
  const SettingsState({required this.status, required this.settings});

  final SettingsStatus status;
  final SettingsModel settings;

  @override
  List<Object> get props => [status, settings];
}
