part of 'task_bloc.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.load() = _Load;
  const factory TaskEvent.generate() = _Generate;
  const factory TaskEvent.toggle(String taskId) = _Toggle;
  const factory TaskEvent.refresh() = _Refresh;
}
