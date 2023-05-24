import 'package:copy_with_extension/copy_with_extension.dart';

part 'settings_model.g.dart';

@CopyWith()
class SettingsModel {
  const SettingsModel({
    required this.isAutoStartTask,
    required this.isAutoStartBreak,
  });

  final bool isAutoStartTask;
  final bool isAutoStartBreak;
}