part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.load() = _Load;
  const factory SettingsEvent.updateGoals(String goals) = _UpdateGoals;
  const factory SettingsEvent.updateFrequency(int hours) = _UpdateFrequency;
  const factory SettingsEvent.updateTaskCount(int count) = _UpdateTaskCount;
  const factory SettingsEvent.toggleUnlimitedRegen(bool value) = _ToggleUnlimitedRegen;
  const factory SettingsEvent.resetData() = _ResetData;
  const factory SettingsEvent.spawnTestNotification() = _SpawnTestNotification;
}