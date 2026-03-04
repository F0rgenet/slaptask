import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:slaptask/data/models/app_settings.dart';
import 'package:slaptask/data/models/app_state.dart';
import 'package:slaptask/data/models/day_tasks.dart';
import 'package:slaptask/data/models/task.dart';
import 'package:slaptask/data/repositories/task_repository.dart';
import 'package:slaptask/services/storage_service.dart';
import '../helpers/mocks.dart';

void main() {
  late MockStorageService mockStorage;
  late MockApiService mockApi;
  late TaskRepository repository;

  setUpAll(() {
    registerFallbackValue(DayTasks(date: '2026-03-04', tasks: []));
  });

  setUp(() {
    mockStorage = MockStorageService();
    mockApi = MockApiService();
    repository = TaskRepository(mockStorage, mockApi);
  });

  group('TaskRepository', () {
    test('loadState combines settings and history correctly', () {
      final settings = AppSettings(goals: 'Be strong', taskCount: 3);
      final history = [DayTasks(date: '2026-03-04', tasks: [])];
      when(() => mockStorage.loadSettings()).thenReturn(settings);
      when(() => mockStorage.loadHistory()).thenReturn(history);
      final state = repository.loadState();
      expect(state.goals, 'Be strong');
      expect(state.taskCount, 3);
      expect(state.days, history);
    });

    test('toggleTask toggles completion status and saves to storage', () async {
      final today = StorageService.getTodayKey();
      final task1 = Task(id: '1', text: 'Pushups', date: today, completed: false);
      final currentDay = DayTasks(date: today, tasks: [task1]);
      final initialState = AppState(days: [currentDay]);
      when(() => mockStorage.saveDay(any())).thenAnswer((_) async {});
      final newState = await repository.toggleTask(initialState, '1');
      expect(newState.days.first.tasks.first.completed, true);
      verify(() => mockStorage.saveDay(any())).called(1);
    });
  });
}
