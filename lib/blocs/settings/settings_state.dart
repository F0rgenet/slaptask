import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.loading() = SettingsLoading;
  const factory SettingsState.loaded({
    required String goals,
    required int frequencyHours,
    required int taskCount,
    required bool unlimitedRegen,
  }) = SettingsLoaded;
  const factory SettingsState.dataReset() = SettingsDataReset;
}
