import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

@HiveType(typeId: 2, adapterName: 'AppSettingsAdapter')
@freezed
sealed class AppSettings with _$AppSettings {
  factory AppSettings({
    @HiveField(0) String? goals,
    @HiveField(1) @Default(5) int taskCount,
    @HiveField(2) @Default(24) int frequencyHours,
    @HiveField(3) @Default(false) bool unlimitedRegen,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);
}