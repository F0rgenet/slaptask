import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models.dart';
import '../../services/storage_service.dart';
import '../../main.dart';
import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AppState appState;
  final Function(AppState) onStateChanged;

  SettingsBloc({required this.appState, required this.onStateChanged}) : super(const SettingsState.loading()) {
    on<SettingsLoad>(_onLoad);
    on<SettingsUpdateGoals>(_onUpdateGoals);
    on<SettingsUpdateFrequency>(_onUpdateFrequency);
    on<SettingsUpdateTaskCount>(_onUpdateTaskCount);
    on<SettingsToggleUnlimitedRegen>(_onToggleUnlimitedRegen);
    on<SettingsResetData>(_onResetData);
    on<SettingsSpawnTestNotification>(_onSpawnTestNotification);

    add(const SettingsEvent.load());
  }

  void _onLoad(SettingsLoad event, Emitter<SettingsState> emit) {
    emit(SettingsState.loaded(
      goals: appState.goals ?? '',
      frequencyHours: appState.frequencyHours,
      taskCount: appState.taskCount,
      unlimitedRegen: appState.unlimitedRegen,
    ));
  }

  void _onUpdateGoals(SettingsUpdateGoals event, Emitter<SettingsState> emit) {
    appState.goals = event.goals;
    _saveAndEmit(emit);
  }

  void _onUpdateFrequency(SettingsUpdateFrequency event, Emitter<SettingsState> emit) {
    appState.frequencyHours = event.hours;
    schedulePeriodicTask(event.hours);
    _saveAndEmit(emit);
  }

  void _onUpdateTaskCount(SettingsUpdateTaskCount event, Emitter<SettingsState> emit) {
    appState.taskCount = event.count;
    _saveAndEmit(emit);
  }

  void _onToggleUnlimitedRegen(SettingsToggleUnlimitedRegen event, Emitter<SettingsState> emit) {
    appState.unlimitedRegen = event.value;
    _saveAndEmit(emit);
  }

  Future<void> _onResetData(SettingsResetData event, Emitter<SettingsState> emit) async {
    final emptyState = AppState();
    await StorageService.save(emptyState);
    onStateChanged(emptyState);
    emit(const SettingsState.dataReset());
  }

  Future<void> _onSpawnTestNotification(SettingsSpawnTestNotification event, Emitter<SettingsState> emit) async {
    await showTestNotification();
  }

  void _saveAndEmit(Emitter<SettingsState> emit) {
    StorageService.save(appState);
    onStateChanged(appState);
    emit(SettingsState.loaded(
      goals: appState.goals ?? '',
      frequencyHours: appState.frequencyHours,
      taskCount: appState.taskCount,
      unlimitedRegen: appState.unlimitedRegen,
    ));
  }
}
