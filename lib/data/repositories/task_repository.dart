import '../models/app_state.dart';
import '../models/app_settings.dart';
import '../models/day_tasks.dart';
import '../../services/api_service.dart';
import '../../services/storage_service.dart';

class TaskRepository {
  final StorageService _storage;
  final ApiService _api;

  TaskRepository(this._storage, this._api);

  AppState loadState() {
    final settings = _storage.loadSettings();
    final history = _storage.loadHistory();

    return AppState(
      goals: settings.goals,
      days: history,
      taskCount: settings.taskCount,
      frequencyHours: settings.frequencyHours,
      unlimitedRegen: settings.unlimitedRegen,
    );
  }

  Future<void> saveSettingsOnly(AppState state) async {
    final settings = AppSettings(
      goals: state.goals,
      taskCount: state.taskCount,
      frequencyHours: state.frequencyHours,
      unlimitedRegen: state.unlimitedRegen,
    );
    await _storage.saveSettings(settings);
  }

  Future<void> saveFullState(AppState state) async {
    await saveSettingsOnly(state);
  }

  Future<void> resetData() async {
    await _storage.clearAll();
  }

  Future<AppState> generateTodayTasks(AppState currentState) async {
    if (currentState.goals == null) throw Exception("No goals");

    final newDay = await _api.generateDayTasks(
      currentState.goals!,
      currentState.days,
      currentState.taskCount,
    );

    await _storage.saveDay(newDay);

    return loadState(); 
  }

  Future<AppState> toggleTask(AppState currentState, String taskId) async {
    final todayKey = StorageService.getTodayKey();
  
    final dayIndex = currentState.days.indexWhere((d) => d.date == todayKey);
    if (dayIndex == -1) return currentState;

    final currentDay = currentState.days[dayIndex];
    
    final updatedTasks = currentDay.tasks.map((t) {
      if (t.id != taskId) return t;
      return t.copyWith(completed: !t.completed);
    }).toList();

    final updatedDay = currentDay.copyWith(tasks: updatedTasks);

    await _storage.saveDay(updatedDay);

    final updatedDays = List<DayTasks>.from(currentState.days);
    updatedDays[dayIndex] = updatedDay;
    
    return currentState.copyWith(days: updatedDays);
  }
}