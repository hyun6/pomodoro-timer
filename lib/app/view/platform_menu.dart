import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoro_timer/services/material_context.dart';
import 'package:window_manager/window_manager.dart';

List<PlatformMenu> getPlatformMenus() {
  final platformMenus = [
    PlatformMenu(
      label: 'pomo_timer',
      menus: [
        PlatformMenuItemGroup(
          members: [
            if (PlatformProvidedMenuItem.hasMenu(
              PlatformProvidedMenuItemType.about,
            ))
              const PlatformProvidedMenuItem(
                type: PlatformProvidedMenuItemType.about,
              ),
          ],
        ),
        PlatformMenuItemGroup(
          members: [
            PlatformMenuItem(
              label: 'Settings',
              shortcut: const SingleActivator(
                LogicalKeyboardKey.comma,
                meta: true,
              ),
              onSelected: () {
                final context = navigatorState.currentContext;
                if (context == null) return;

                showDialog<void>(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('settings'),
                    content: const Text('gg'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        autofocus: true,
                        child: const Text('ok'),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        PlatformMenuItemGroup(
          members: [
            if (PlatformProvidedMenuItem.hasMenu(
              PlatformProvidedMenuItemType.servicesSubmenu,
            ))
              const PlatformProvidedMenuItem(
                type: PlatformProvidedMenuItemType.servicesSubmenu,
              ),
          ],
        ),
        PlatformMenuItemGroup(
          members: [
            if (PlatformProvidedMenuItem.hasMenu(
              PlatformProvidedMenuItemType.quit,
            ))
              const PlatformProvidedMenuItem(
                type: PlatformProvidedMenuItemType.quit,
              ),
          ],
        ),
      ],
    ),
    PlatformMenu(
      label: 'View',
      menus: [
        if (PlatformProvidedMenuItem.hasMenu(
          PlatformProvidedMenuItemType.toggleFullScreen,
        ))
          const PlatformProvidedMenuItem(
            type: PlatformProvidedMenuItemType.toggleFullScreen,
          ),
      ],
    ),
    PlatformMenu(
      label: 'Window',
      menus: [
        PlatformMenuItem(
          label: 'Close',
          shortcut: const SingleActivator(
            LogicalKeyboardKey.keyW,
            meta: true,
          ),
          onSelected: windowManager.close,
        ),
      ],
    ),
  ];
  return platformMenus;
}
