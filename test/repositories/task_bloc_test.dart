import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:slaptask/blocs/task/task_bloc.dart';
import 'package:slaptask/data/models/app_state.dart';
import 'package:slaptask/data/models/day_tasks.dart';
import 'package:slaptask/services/storage_service.dart';
import '../helpers/mocks.dart';

void main() {
  late MockTaskRepository mockRepo;
  late AppState defaultState;

  setUpAll(() {
    registerFallbackValue(const AppState());
  });

  setUp(() {
    mockRepo = MockTaskRepository();
    defaultState = const AppState(goals: 'Test Goals');
  });

  group('TaskBloc', () {
    blocTest<TaskBloc, TaskState>(
      'emits [loading, loaded] when Load is added',
      build: () {
        when(() => mockRepo.loadState()).thenReturn(defaultState);
        return TaskBloc(mockRepo);
      },
      act: (bloc) => bloc.add(const TaskEvent.load()),
      expect: () => [const TaskState.loading(), TaskState.loaded(appState: defaultState)],
    );

    blocTest<TaskBloc, TaskState>(
      'handles Generate event: success path',
      build: () {
        final today = StorageService.getTodayKey();
        final generatedState = defaultState.copyWith(
          days: [DayTasks(date: today, tasks: [])],
        );
        when(() => mockRepo.generateTodayTasks(any())).thenAnswer((_) async => generatedState);
        return TaskBloc(mockRepo);
      },
      seed: () => TaskState.loaded(appState: defaultState),
      act: (bloc) => bloc.add(const TaskEvent.generate()),
      expect: () {
        final today = StorageService.getTodayKey();
        final expectedState = defaultState.copyWith(
          days: [DayTasks(date: today, tasks: [])],
        );
        return [
          TaskState.loaded(appState: defaultState, isGenerating: true),
          TaskState.loaded(appState: expectedState, isGenerating: false),
        ];
      },
    );
  });
}
