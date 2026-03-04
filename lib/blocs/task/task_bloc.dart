import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/app_state.dart';
import '../../data/repositories/task_repository.dart';

part 'task_event.dart';
part 'task_state.dart';
part 'task_bloc.freezed.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository _repository;

  TaskBloc(this._repository) : super(const TaskState.initial()) {
    on<_Load>(_onLoad);
    on<_Generate>(_onGenerate);
    on<_Toggle>(_onToggle);
    on<_Refresh>(_onRefresh);
  }

  void _onLoad(_Load event, Emitter<TaskState> emit) {
    emit(const TaskState.loading());
    final state = _repository.loadState();
    emit(TaskState.loaded(appState: state));
  }

  void _onRefresh(_Refresh event, Emitter<TaskState> emit) {
    if (state is _Loaded) {
      final current = (state as _Loaded).appState;
      final fresh = _repository.loadState();
      if (current != fresh) {
        emit(TaskState.loaded(appState: fresh));
      }
    }
  }

  Future<void> _onGenerate(_Generate event, Emitter<TaskState> emit) async {
    final currentState = state;
    if (currentState is! _Loaded) return;

    emit(currentState.copyWith(isGenerating: true, error: null));

    try {
      final newState = await _repository.generateTodayTasks(currentState.appState);
      emit(currentState.copyWith(appState: newState, isGenerating: false));
    } catch (e) {
      emit(currentState.copyWith(isGenerating: false, error: e.toString()));
    }
  }

  Future<void> _onToggle(_Toggle event, Emitter<TaskState> emit) async {
    final currentState = state;
    if (currentState is! _Loaded) return;

    final newState = await _repository.toggleTask(currentState.appState, event.taskId);
    emit(currentState.copyWith(appState: newState));
  }
}
