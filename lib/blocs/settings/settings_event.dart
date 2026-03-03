import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_event.freezed.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.load() = SettingsLoad;
  const factory SettingsEvent.updateGoals(String goals) = SettingsUpdateGoals;
  const factory SettingsEvent.updateFrequency(int hours) = SettingsUpdateFrequency;
  const factory SettingsEvent.updateTaskCount(int count) = SettingsUpdateTaskCount;
  const factory SettingsEvent.toggleUnlimitedRegen(bool value) = SettingsToggleUnlimitedRegen;
  const factory SettingsEvent.resetData() = SettingsResetData;
  const factory SettingsEvent.spawnTestNotification() = SettingsSpawnTestNotification;
}
