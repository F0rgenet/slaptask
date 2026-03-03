import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

import 'theme.dart';
import 'models.dart';
import 'services/storage_service.dart';
import 'services/api_service.dart';
import 'screens/onboarding_screen.dart';
import 'screens/main_screen.dart';
import 'screens/settings_screen.dart';
import 'blocs/settings/settings_bloc.dart';

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

        final prefs = await SharedPreferences.getInstance();
        final raw = prefs.getString('slaptask-state');
        if (raw == null) return true;

        final state = AppState.fromJson(jsonDecode(raw));
        if (state.goals == null || state.goals!.isEmpty) return true;

        final today = StorageService.getTodayKey();
        final alreadyExists = state.days.any((d) => d.date == today);
        if (alreadyExists) return true;

        final rawTaskLines = await ApiService.generateRawTasks(
          apiKey: apiKey,
          goals: state.goals!,
          allHistory: state.days,
          taskCount: state.taskCount,
        );

        if (rawTaskLines.isNotEmpty) {
          final tasks =
              rawTaskLines.asMap().entries.map((e) => Task(id: '$today-${e.key}', text: e.value, date: today)).toList();

          state.days.add(DayTasks(date: today, tasks: tasks));
          await prefs.setString('slaptask-state', jsonEncode(state.toJson()));

          await showTestNotification(body: '${state.taskCount} задач готовы. Действуй или страдай.');
        }
      } catch (e) {
        debugPrint("Background task error: $e");
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
    body: '5 задач готовы. Действуй или страдай.',
    notificationDetails: const NotificationDetails(
      android: AndroidNotificationDetails(
        'slaptask_channel',
        'SlapTask Daily',
        importance: Importance.high,
        priority: Priority.high,
      ),
      linux: LinuxNotificationDetails(),
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await _notifications.initialize(settings: _notificationInitializationSettings);

  if (Platform.isAndroid || Platform.isIOS) {
    await Workmanager().initialize(callbackDispatcher);
    schedulePeriodicTask(24);
  }

  runApp(const SlapTaskApp());
}

Duration _getDelayUntil10AM() {
  final now = DateTime.now();
  var target = DateTime(now.year, now.month, now.day, 10, 0);
  if (now.isAfter(target)) {
    target = target.add(const Duration(days: 1));
  }
  return target.difference(now);
}

class SlapTaskApp extends StatefulWidget {
  const SlapTaskApp({super.key});

  @override
  State<SlapTaskApp> createState() => _SlapTaskAppState();
}

class _SlapTaskAppState extends State<SlapTaskApp> {
  String _screen = 'loading';
  AppState _state = AppState();
  late final String _apiKey;

  @override
  void initState() {
    super.initState();
    _apiKey = dotenv.env['PROXYAPI_KEY'] ?? '';
    _loadData();
  }

  Future<void> _loadData() async {
    _state = await StorageService.load();
    schedulePeriodicTask(_state.frequencyHours);
    setState(() {
      if (_state.goals == null || _state.goals!.isEmpty) {
        _screen = 'onboarding';
      } else {
        _screen = 'main';
      }
    });
  }

  void _onGoalsSaved(String goals) {
    _state.goals = goals;
    StorageService.save(_state);
    setState(() => _screen = 'main');
  }

  void _onStateChanged(AppState updated) {
    setState(() => _state = updated);
    StorageService.save(updated);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SlapTask',
      theme: SlapTheme.theme,
      debugShowCheckedModeBanner: false,
      home: _buildScreen(),
    );
  }

  Widget _buildScreen() {
    if (_apiKey.isEmpty) {
      return const Scaffold(
        body: Center(child: Text('Error: PROXY_API_KEY not found in .env')),
      );
    }

    switch (_screen) {
      case 'loading':
        return _buildLoading();
      case 'onboarding':
        return OnboardingScreen(apiKey: _apiKey, onGoalsSaved: _onGoalsSaved);
      case 'settings':
        return BlocProvider(
          create: (context) => SettingsBloc(
            appState: _state,
            onStateChanged: _onStateChanged,
          ),
          child: SettingsScreen(
            onBack: () => setState(() => _screen = 'main'),
            onResetComplete: () => setState(() => _screen = 'onboarding'),
          ),
        );
      case 'main':
      default:
        return MainScreen(
          state: _state,
          apiKey: _apiKey,
          onStateChanged: _onStateChanged,
          onOpenSettings: () => setState(() => _screen = 'settings'),
        );
    }
  }

  Widget _buildLoading() {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(strokeWidth: 2, color: SlapTheme.primary),
        ),
      ),
    );
  }
}
