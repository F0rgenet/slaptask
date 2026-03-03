part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.loading() = _Loading;
  const factory SettingsState.loaded({
    required AppState appState,
  }) = _Loaded;
  const factory SettingsState.dataReset() = _DataReset;
}