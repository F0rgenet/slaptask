part of 'task_bloc.dart';

@freezed
class TaskState with _$TaskState {
  const factory TaskState.initial() = _Initial;
  const factory TaskState.loading() = _Loading;
  const factory TaskState.loaded({
    required AppState appState,
    @Default(false) bool isGenerating,
    String? error,
  }) = _Loaded;
}