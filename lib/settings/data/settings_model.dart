import 'package:copy_with_extension/copy_with_extension.dart';

part 'settings_model.g.dart';

@CopyWith()
class SettingsModel {
  const SettingsModel({
    required this.isAutoStartTask,
    required this.isAutoStartBreak,
    required this.isAutoStartTaskWhenAppLaunched,
    required this.isMonitorOff,
  });

  final bool isAutoStartTask;
  final bool isAutoStartBreak;
  // 앱 실행 시 타이머 자동 시작
  final bool isAutoStartTaskWhenAppLaunched;
  // 모니터 끄기
  final bool isMonitorOff;
}
