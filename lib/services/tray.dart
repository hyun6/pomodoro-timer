import 'dart:developer';

import 'package:system_tray/system_tray.dart';

class TrayService {
  final _systemTray = SystemTray();

  Future<void> init() async {
    await _systemTray.initSystemTray(iconPath: 'assets/icon/tray_icon.png');
    _systemTray.registerSystemTrayEventHandler((eventName) {
      switch (eventName) {
        case kSystemTrayEventClick:
          {
            log('click tray');
            break;
          }
      }
    });
  }

  void setTitle(String title) {
    _systemTray.setTitle(title);
  }
}
