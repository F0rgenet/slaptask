import 'package:freezed_annotation/freezed_annotation.dart';
import 'day_tasks.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
sealed class AppState with _$AppState {
  const factory AppState({
    String? goals,
    @Default([]) List<DayTasks> days,
    @Default(5) int taskCount,
    @Default(24) int frequencyHours,
    @Default(false) bool unlimitedRegen,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}