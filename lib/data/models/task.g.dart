// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Task _$TaskFromJson(Map<String, dynamic> json) => _Task(
  id: json['id'] as String,
  text: json['text'] as String,
  completed: json['completed'] as bool? ?? false,
  date: json['date'] as String,
);

Map<String, dynamic> _$TaskToJson(_Task instance) => <String, dynamic>{
  'id': instance.id,
  'text': instance.text,
  'completed': instance.completed,
  'date': instance.date,
};
