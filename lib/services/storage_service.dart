import 'package:hive_ce_flutter/hive_flutter.dart';
import '../data/models/app_settings.dart';
import '../data/models/day_tasks.dart';
import '../data/models/task.dart';

class StorageService {
  static const _settingsBoxName = 'settings_box';
  static const _historyBoxName = 'history_box';
  static const _settingsKey = 'app_settings';

  final Box<AppSettings> _settingsBox;
  final Box<DayTasks> _historyBox;

  StorageService(this._settingsBox, this._historyBox);

  static Future<StorageService> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(TaskAdapter());
    Hive.registerAdapter(DayTasksAdapter());
    Hive.registerAdapter(AppSettingsAdapter());

    final settingsBox = await Hive.openBox<AppSettings>(_settingsBoxName);
    final historyBox = await Hive.openBox<DayTasks>(_historyBoxName);

    return StorageService(settingsBox, historyBox);
  }

  AppSettings loadSettings() {
    return _settingsBox.get(_settingsKey) ?? AppSettings();
  }

  Future<void> saveSettings(AppSettings settings) async {
    await _settingsBox.put(_settingsKey, settings);
  }

  List<DayTasks> loadHistory() {
    final list = _historyBox.values.toList();
    list.sort((a, b) => b.date.compareTo(a.date));
    return list;
  }

  DayTasks? getDay(String dateKey) {
    return _historyBox.get(dateKey);
  }

  Future<void> saveDay(DayTasks day) async {
    await _historyBox.put(day.date, day);
  }

  Future<void> clearAll() async {
    await _settingsBox.clear();
    await _historyBox.clear();
  }

  static String getTodayKey() {
    final now = DateTime.now();
    return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
  }
}
