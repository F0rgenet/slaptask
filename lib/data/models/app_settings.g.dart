// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppSettingsAdapter extends TypeAdapter<AppSettings> {
  @override
  final typeId = 2;

  @override
  AppSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppSettings(
      goals: fields[0] as String?,
      taskCount: fields[1] == null ? 5 : (fields[1] as num).toInt(),
      frequencyHours: fields[2] == null ? 24 : (fields[2] as num).toInt(),
      unlimitedRegen: fields[3] == null ? false : fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AppSettings obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.goals)
      ..writeByte(1)
      ..write(obj.taskCount)
      ..writeByte(2)
      ..write(obj.frequencyHours)
      ..writeByte(3)
      ..write(obj.unlimitedRegen);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => _AppSettings(
  goals: json['goals'] as String?,
  taskCount: (json['taskCount'] as num?)?.toInt() ?? 5,
  frequencyHours: (json['frequencyHours'] as num?)?.toInt() ?? 24,
  unlimitedRegen: json['unlimitedRegen'] as bool? ?? false,
);

Map<String, dynamic> _$AppSettingsToJson(_AppSettings instance) =>
    <String, dynamic>{
      'goals': instance.goals,
      'taskCount': instance.taskCount,
      'frequencyHours': instance.frequencyHours,
      'unlimitedRegen': instance.unlimitedRegen,
    };
