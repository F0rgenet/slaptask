import 'package:freezed_annotation/freezed_annotation.dart';
import 'task.dart';

part 'day_tasks.freezed.dart';
part 'day_tasks.g.dart';

@freezed
sealed class DayTasks with _$DayTasks {
  const DayTasks._();

  const factory DayTasks({
    required String date,
    required List<Task> tasks,
    @Default(false) bool regenerated,
  }) = _DayTasks;

  int get completedCount => tasks.where((t) => t.completed).length;

  factory DayTasks.fromJson(Map<String, dynamic> json) => _$DayTasksFromJson(json);
}