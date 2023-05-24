// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SettingsModelCWProxy {
  SettingsModel autoStartTask(bool autoStartTask);

  SettingsModel autoStartBreak(bool autoStartBreak);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SettingsModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SettingsModel(...).copyWith(id: 12, name: "My name")
  /// ````
  SettingsModel call({
    bool? autoStartTask,
    bool? autoStartBreak,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSettingsModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSettingsModel.copyWith.fieldName(...)`
class _$SettingsModelCWProxyImpl implements _$SettingsModelCWProxy {
  const _$SettingsModelCWProxyImpl(this._value);

  final SettingsModel _value;

  @override
  SettingsModel autoStartTask(bool autoStartTask) =>
      this(autoStartTask: autoStartTask);

  @override
  SettingsModel autoStartBreak(bool autoStartBreak) =>
      this(autoStartBreak: autoStartBreak);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SettingsModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SettingsModel(...).copyWith(id: 12, name: "My name")
  /// ````
  SettingsModel call({
    Object? autoStartTask = const $CopyWithPlaceholder(),
    Object? autoStartBreak = const $CopyWithPlaceholder(),
  }) {
    return SettingsModel(
      isAutoStartTask:
          autoStartTask == const $CopyWithPlaceholder() || autoStartTask == null
              ? _value.isAutoStartTask
              // ignore: cast_nullable_to_non_nullable
              : autoStartTask as bool,
      isAutoStartBreak: autoStartBreak == const $CopyWithPlaceholder() ||
              autoStartBreak == null
          ? _value.isAutoStartBreak
          // ignore: cast_nullable_to_non_nullable
          : autoStartBreak as bool,
    );
  }
}

extension $SettingsModelCopyWith on SettingsModel {
  /// Returns a callable class that can be used as follows: `instanceOfSettingsModel.copyWith(...)` or like so:`instanceOfSettingsModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SettingsModelCWProxy get copyWith => _$SettingsModelCWProxyImpl(this);
}
