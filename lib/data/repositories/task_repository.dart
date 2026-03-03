import '../models/app_state.dart';
import '../models/day_tasks.dart';
import '../../services/api_service.dart';
import '../../services/storage_service.dart';

class TaskRepository {
  final StorageService _storage;
  final ApiService _api;

  TaskRepository(this._storage, this._api);

  AppState loadState() => _storage.load();

  Future<void> saveState(AppState state) => _storage.save(state);

  Future<AppState> generateTodayTasks(AppState currentState) async {
    if (currentState.goals == null) throw Exception("No goals set");

    final newDay = await _api.generateDayTasks(
      currentState.goals!,
      currentState.days,
      currentState.taskCount,
    );

    final todayKey = StorageService.getTodayKey();
    final existingIndex = currentState.days.indexWhere((d) => d.date == todayKey);
    
    List<DayTasks> updatedDays = List.from(currentState.days);
    
    if (existingIndex >= 0) {
      updatedDays[existingIndex] = newDay.copyWith(
        regenerated: !currentState.unlimitedRegen,
      );
    } else {
      updatedDays = [...currentState.days, newDay];
    }

    final newState = currentState.copyWith(days: updatedDays);
    await saveState(newState);
    return newState;
  }

  Future<AppState> toggleTask(AppState currentState, String taskId) async {
    final todayKey = StorageService.getTodayKey();
    
    final updatedDays = currentState.days.map((day) {
      if (day.date != todayKey) return day;
      
      final updatedTasks = day.tasks.map((t) {
        if (t.id != taskId) return t;
        return t.copyWith(completed: !t.completed);
      }).toList();

      return day.copyWith(tasks: updatedTasks);
    }).toList();

    final newState = currentState.copyWith(days: updatedDays);
    await saveState(newState);
    return newState;
  }
}