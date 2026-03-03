import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/app_state.dart';
import '../../data/repositories/task_repository.dart';
import '../../main.dart'; 

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final TaskRepository _repository;

  SettingsBloc(this._repository) : super(const SettingsState.loading()) {
    on<_Load>(_onLoad);
    on<_UpdateGoals>(_onUpdateGoals);
    on<_UpdateFrequency>(_onUpdateFrequency);
    on<_UpdateTaskCount>(_onUpdateTaskCount);
    on<_ToggleUnlimitedRegen>(_onToggleUnlimitedRegen);
    on<_ResetData>(_onResetData);
    on<_SpawnTestNotification>(_onSpawnTestNotification);
    add(const SettingsEvent.load());
  }

  void _onLoad(_Load event, Emitter<SettingsState> emit) {
    final state = _repository.loadState();
    emit(SettingsState.loaded(appState: state));
  }

  Future<void> _updateState(Emitter<SettingsState> emit, AppState newState) async {
    await _repository.saveSettingsOnly(newState);
    emit(SettingsState.loaded(appState: newState));
  }

  Future<void> _onUpdateGoals(_UpdateGoals event, Emitter<SettingsState> emit) async {
    if (state is _Loaded) {
      final current = (state as _Loaded).appState;
      await _updateState(emit, current.copyWith(goals: event.goals));
    }
  }

  Future<void> _onUpdateFrequency(_UpdateFrequency event, Emitter<SettingsState> emit) async {
    if (state is _Loaded) {
      final current = (state as _Loaded).appState;
      schedulePeriodicTask(event.hours);
      await _updateState(emit, current.copyWith(frequencyHours: event.hours));
    }
  }

  Future<void> _onUpdateTaskCount(_UpdateTaskCount event, Emitter<SettingsState> emit) async {
    if (state is _Loaded) {
      final current = (state as _Loaded).appState;
      await _updateState(emit, current.copyWith(taskCount: event.count));
    }
  }

  Future<void> _onToggleUnlimitedRegen(_ToggleUnlimitedRegen event, Emitter<SettingsState> emit) async {
    if (state is _Loaded) {
      final current = (state as _Loaded).appState;
      await _updateState(emit, current.copyWith(unlimitedRegen: event.value));
    }
  }

  Future<void> _onResetData(_ResetData event, Emitter<SettingsState> emit) async {
    await _repository.resetData();
    emit(const SettingsState.dataReset());
  }

  Future<void> _onSpawnTestNotification(_SpawnTestNotification event, Emitter<SettingsState> emit) async {
    await showTestNotification();
  }
}