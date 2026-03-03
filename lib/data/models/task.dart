import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@HiveType(typeId: 0, adapterName: 'TaskAdapter')
@freezed
sealed class Task with _$Task {
  factory Task({
    @HiveField(0) required String id,
    @HiveField(1) required String text,
    @HiveField(2) @Default(false) bool completed,
    @HiveField(3) required String date,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}