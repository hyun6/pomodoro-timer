// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SettingsModelCWProxy {
  SettingsModel isAutoStartTask(bool isAutoStartTask);

  SettingsModel isAutoStartBreak(bool isAutoStartBreak);

  SettingsModel isAutoStartTaskWhenAppLaunched(
      bool isAutoStartTaskWhenAppLaunched);

  SettingsModel isMonitorOff(bool isMonitorOff);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SettingsModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SettingsModel(...).copyWith(id: 12, name: "My name")
  /// ````
  SettingsModel call({
    bool? isAutoStartTask,
    bool? isAutoStartBreak,
    bool? isAutoStartTaskWhenAppLaunched,
    bool? isMonitorOff,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSettingsModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSettingsModel.copyWith.fieldName(...)`
class _$SettingsModelCWProxyImpl implements _$SettingsModelCWProxy {
  const _$SettingsModelCWProxyImpl(this._value);

  final SettingsModel _value;

  @override
  SettingsModel isAutoStartTask(bool isAutoStartTask) =>
      this(isAutoStartTask: isAutoStartTask);

  @override
  SettingsModel isAutoStartBreak(bool isAutoStartBreak) =>
      this(isAutoStartBreak: isAutoStartBreak);

  @override
  SettingsModel isAutoStartTaskWhenAppLaunched(
          bool isAutoStartTaskWhenAppLaunched) =>
      this(isAutoStartTaskWhenAppLaunched: isAutoStartTaskWhenAppLaunched);

  @override
  SettingsModel isMonitorOff(bool isMonitorOff) =>
      this(isMonitorOff: isMonitorOff);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SettingsModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SettingsModel(...).copyWith(id: 12, name: "My name")
  /// ````
  SettingsModel call({
    Object? isAutoStartTask = const $CopyWithPlaceholder(),
    Object? isAutoStartBreak = const $CopyWithPlaceholder(),
    Object? isAutoStartTaskWhenAppLaunched = const $CopyWithPlaceholder(),
    Object? isMonitorOff = const $CopyWithPlaceholder(),
  }) {
    return SettingsModel(
      isAutoStartTask: isAutoStartTask == const $CopyWithPlaceholder() ||
              isAutoStartTask == null
          ? _value.isAutoStartTask
          // ignore: cast_nullable_to_non_nullable
          : isAutoStartTask as bool,
      isAutoStartBreak: isAutoStartBreak == const $CopyWithPlaceholder() ||
              isAutoStartBreak == null
          ? _value.isAutoStartBreak
          // ignore: cast_nullable_to_non_nullable
          : isAutoStartBreak as bool,
      isAutoStartTaskWhenAppLaunched:
          isAutoStartTaskWhenAppLaunched == const $CopyWithPlaceholder() ||
                  isAutoStartTaskWhenAppLaunched == null
              ? _value.isAutoStartTaskWhenAppLaunched
              // ignore: cast_nullable_to_non_nullable
              : isAutoStartTaskWhenAppLaunched as bool,
      isMonitorOff:
          isMonitorOff == const $CopyWithPlaceholder() || isMonitorOff == null
              ? _value.isMonitorOff
              // ignore: cast_nullable_to_non_nullable
              : isMonitorOff as bool,
    );
  }
}

extension $SettingsModelCopyWith on SettingsModel {
  /// Returns a callable class that can be used as follows: `instanceOfSettingsModel.copyWith(...)` or like so:`instanceOfSettingsModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SettingsModelCWProxy get copyWith => _$SettingsModelCWProxyImpl(this);
}
