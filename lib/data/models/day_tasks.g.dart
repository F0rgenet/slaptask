// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DayTasks _$DayTasksFromJson(Map<String, dynamic> json) => _DayTasks(
  date: json['date'] as String,
  tasks: (json['tasks'] as List<dynamic>)
      .map((e) => Task.fromJson(e as Map<String, dynamic>))
      .toList(),
  regenerated: json['regenerated'] as bool? ?? false,
);

Map<String, dynamic> _$DayTasksToJson(_DayTasks instance) => <String, dynamic>{
  'date': instance.date,
  'tasks': instance.tasks,
  'regenerated': instance.regenerated,
};
