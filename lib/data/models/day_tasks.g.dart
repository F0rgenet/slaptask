// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_tasks.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayTasksAdapter extends TypeAdapter<DayTasks> {
  @override
  final typeId = 1;

  @override
  DayTasks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read()};
    return DayTasks(
      date: fields[0] as String,
      tasks: (fields[1] as List).cast<Task>(),
      regenerated: fields[2] == null ? false : fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DayTasks obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.tasks)
      ..writeByte(2)
      ..write(obj.regenerated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is DayTasksAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DayTasks _$DayTasksFromJson(Map<String, dynamic> json) => _DayTasks(
  date: json['date'] as String,
  tasks: (json['tasks'] as List<dynamic>).map((e) => Task.fromJson(e as Map<String, dynamic>)).toList(),
  regenerated: json['regenerated'] as bool? ?? false,
);

Map<String, dynamic> _$DayTasksToJson(_DayTasks instance) => <String, dynamic>{
  'date': instance.date,
  'tasks': instance.tasks,
  'regenerated': instance.regenerated,
};
