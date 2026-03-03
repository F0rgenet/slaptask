// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppState _$AppStateFromJson(Map<String, dynamic> json) => _AppState(
  goals: json['goals'] as String?,
  days:
      (json['days'] as List<dynamic>?)
          ?.map((e) => DayTasks.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  taskCount: (json['taskCount'] as num?)?.toInt() ?? 5,
  frequencyHours: (json['frequencyHours'] as num?)?.toInt() ?? 24,
  unlimitedRegen: json['unlimitedRegen'] as bool? ?? false,
);

Map<String, dynamic> _$AppStateToJson(_AppState instance) => <String, dynamic>{
  'goals': instance.goals,
  'days': instance.days,
  'taskCount': instance.taskCount,
  'frequencyHours': instance.frequencyHours,
  'unlimitedRegen': instance.unlimitedRegen,
};
