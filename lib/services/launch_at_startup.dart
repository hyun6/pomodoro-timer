import 'dart:io';

import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<void> setup() async {
  final packageInfo = await PackageInfo.fromPlatform();

  launchAtStartup.setup(
    appName: packageInfo.appName,
    appPath: Platform.resolvedExecutable,
  );
}

Future<bool> isEnabled() {
  return launchAtStartup.isEnabled();
}

void enable() {
  launchAtStartup.enable();
}

void disable() {
  launchAtStartup.disable();
}
