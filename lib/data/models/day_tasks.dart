import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';
import 'task.dart';

part 'day_tasks.freezed.dart';
part 'day_tasks.g.dart';

@HiveType(typeId: 1, adapterName: 'DayTasksAdapter')
@freezed
sealed class DayTasks with _$DayTasks {
  DayTasks._();

  factory DayTasks({
    @HiveField(0) required String date,
    @HiveField(1) required List<Task> tasks,
    @HiveField(2) @Default(false) bool regenerated,
  }) = _DayTasks;

  int get completedCount => tasks.where((t) => t.completed).length;

  factory DayTasks.fromJson(Map<String, dynamic> json) => _$DayTasksFromJson(json);
}
