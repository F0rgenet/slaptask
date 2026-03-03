import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';

import 'presentation/theme.dart';
import 'data/repositories/task_repository.dart';
import 'services/api_service.dart';
import 'services/audio_service.dart';
import 'services/storage_service.dart';
import 'blocs/task/task_bloc.dart';
import 'presentation/screens/main_screen.dart';
import 'presentation/screens/onboarding_screen.dart';
import 'presentation/screens/settings_screen.dart';

const _backgroundTaskName = 'slaptask-daily-generate';
final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();

const _notificationInitializationSettings = InitializationSettings(
  android: AndroidInitializationSettings('@mipmap/ic_launcher'),
  linux: LinuxInitializationSettings(defaultActionName: 'Open SlapTask'),
);

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == _backgroundTaskName) {
      try {
        await dotenv.load();
        final apiKey = dotenv.env['PROXYAPI_KEY'];
        if (apiKey == null || apiKey.isEmpty) return true;

        final storage = await StorageService.init();
        final api = ApiService(apiKey);
        final repo = TaskRepository(storage, api);

        final state = repo.loadState();
        if (state.goals == null || state.goals!.isEmpty) return true;

        final today = StorageService.getTodayKey();
        final alreadyExists = state.days.any((d) => d.date == today);
        if (alreadyExists) return true;

        await repo.generateTodayTasks(state);
        await showTestNotification(body: '${state.taskCount} задач готовы. Живо за работу.');
      } catch (e) {
        return false;
      }
    }
    return true;
  });
}

Future<void> showTestNotification({String? body}) async {
  await _notifications.initialize(settings: _notificationInitializationSettings);
  await _notifications.show(
    id: 0,
    title: 'SlapTask',
    body: body ?? '5 задач готовы. Действуй или страдай.',
    notificationDetails: const NotificationDetails(
      android: AndroidNotificationDetails(
        'slaptask_channel',
        'SlapTask Daily',
        importance: Importance.high,
        priority: Priority.high,
      ),
    ),
  );
}

void schedulePeriodicTask(int hours) {
  if (!Platform.isAndroid && !Platform.isIOS) return;
  Workmanager().cancelByUniqueName(_backgroundTaskName);
  Workmanager().registerPeriodicTask(
    _backgroundTaskName,
    _backgroundTaskName,
    frequency: Duration(hours: hours),
    initialDelay: _getDelayUntil10AM(),
    constraints: Constraints(networkType: NetworkType.connected),
  );
}

Duration _getDelayUntil10AM() {
  final now = DateTime.now();
  var target = DateTime(now.year, now.month, now.day, 10, 0);
  if (now.isAfter(target)) {
    target = target.add(const Duration(days: 1));
  }
  return target.difference(now);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await _notifications.initialize(settings: _notificationInitializationSettings);

  final storageService = await StorageService.init();

  if (Platform.isAndroid || Platform.isIOS) {
    await Workmanager().initialize(callbackDispatcher);
  }

  final apiService = ApiService(dotenv.env['PROXYAPI_KEY'] ?? '');
  final audioService = AudioService();
  final taskRepository = TaskRepository(storageService, apiService);

  final settings = storageService.loadSettings();
  schedulePeriodicTask(settings.frequencyHours);

  runApp(SlapTaskApp(
    storageService: storageService,
    apiService: apiService,
    audioService: audioService,
    taskRepository: taskRepository,
  ));
}

class SlapTaskApp extends StatelessWidget {
  final StorageService storageService;
  final ApiService apiService;
  final AudioService audioService;
  final TaskRepository taskRepository;

  const SlapTaskApp({
    super.key,
    required this.storageService,
    required this.apiService,
    required this.audioService,
    required this.taskRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: storageService),
        RepositoryProvider.value(value: apiService),
        RepositoryProvider.value(value: audioService),
        RepositoryProvider.value(value: taskRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => TaskBloc(taskRepository)..add(const TaskEvent.load())),
        ],
        child: MaterialApp(
          title: 'SlapTask',
          theme: SlapTheme.theme,
          debugShowCheckedModeBanner: false,
          home: const AppCoordinator(),
        ),
      ),
    );
  }
}

class AppCoordinator extends StatefulWidget {
  const AppCoordinator({super.key});

  @override
  State<AppCoordinator> createState() => _AppCoordinatorState();
}

class _AppCoordinatorState extends State<AppCoordinator> {
  String _screen = 'loading';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        state.mapOrNull(
          loaded: (s) {
            setState(() {
              if (s.appState.goals == null || s.appState.goals!.isEmpty) {
                _screen = 'onboarding';
              } else if (_screen == 'loading' || _screen == 'onboarding') {
                _screen = 'main';
              }
            });
          },
        );
      },
      builder: (context, state) {
        switch (_screen) {
          case 'loading':
            return const Scaffold(
              body: Center(
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(strokeWidth: 2, color: SlapTheme.primary),
                ),
              ),
            );
          case 'onboarding':
            return OnboardingScreen(
              onFinish: () {
                context.read<TaskBloc>().add(const TaskEvent.refresh());
                setState(() => _screen = 'main');
              },
            );
          case 'settings':
            return SettingsScreen(
              onBack: () {
                context.read<TaskBloc>().add(const TaskEvent.refresh());
                setState(() => _screen = 'main');
              },
              onResetComplete: () {
                context.read<TaskBloc>().add(const TaskEvent.refresh());
                setState(() => _screen = 'onboarding');
              },
            );
          case 'main':
          default:
            return MainScreen(
              onOpenSettings: () => setState(() => _screen = 'settings'),
            );
        }
      },
    );
  }
}