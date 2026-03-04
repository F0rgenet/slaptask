import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:slaptask/blocs/task/task_bloc.dart';
import 'package:slaptask/data/repositories/task_repository.dart';
import 'package:slaptask/services/api_service.dart';
import 'package:slaptask/services/audio_service.dart';
import 'package:slaptask/services/storage_service.dart';

class MockStorageService extends Mock implements StorageService {}
class MockApiService extends Mock implements ApiService {}
class MockAudioService extends Mock implements AudioService {}
class MockTaskRepository extends Mock implements TaskRepository {}
class MockTaskBloc extends MockBloc<TaskEvent, TaskState> implements TaskBloc {}