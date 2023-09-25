class SettingsModel {
  const SettingsModel({
    required this.isAutoStartTask,
    required this.isAutoStartBreak,
    required this.isAutoStartTaskWhenAppLaunched,
    required this.isMonitorOff,
    required this.volume,
  });

  final bool isAutoStartTask;
  final bool isAutoStartBreak;
  // 앱 실행 시 타이머 자동 시작
  final bool isAutoStartTaskWhenAppLaunched;
  // 모니터 끄기
  final bool isMonitorOff;
  // 0~100
  final int volume;

  SettingsModel copyWith({
    bool? isAutoStartTask,
    bool? isAutoStartBreak,
    bool? isAutoStartTaskWhenAppLaunched,
    bool? isMonitorOff,
    int? volume,
  }) {
    return SettingsModel(
      isAutoStartTask: isAutoStartTask ?? this.isAutoStartTask,
      isAutoStartBreak: isAutoStartBreak ?? this.isAutoStartBreak,
      isAutoStartTaskWhenAppLaunched:
          isAutoStartTaskWhenAppLaunched ?? this.isAutoStartTaskWhenAppLaunched,
      isMonitorOff: isMonitorOff ?? this.isMonitorOff,
      volume: volume ?? this.volume,
    );
  }
}
