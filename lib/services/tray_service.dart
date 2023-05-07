import 'package:flutter/material.dart';
import 'package:system_tray/system_tray.dart';

class TrayService {
  final _systemTray = SystemTray();
  VoidCallback? _leftClickHandler;
  VoidCallback? _rightClickHandler;

  Future<void> init() async {
    await _systemTray.initSystemTray(iconPath: 'assets/icon/tray_icon.png');
    _systemTray.registerSystemTrayEventHandler((eventName) {
      switch (eventName) {
        case kSystemTrayEventClick:
          {
            _leftClickHandler?.call();
            break;
          }
        case kSystemTrayEventRightClick:
          {
            _rightClickHandler?.call();
            break;
          }
        default:
          {
            break;
          }
      }
    });
  }

  void setTitle(String title) {
    _systemTray.setTitle(title);
  }

  set leftClickHandler(VoidCallback handler) {
    _leftClickHandler = handler;
  }

  set rightClickHandler(VoidCallback handler) {
    _rightClickHandler = handler;
  }
}
