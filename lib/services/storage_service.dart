import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models.dart';

class StorageService {
  static const _key = 'slaptask-state';

  static Future<AppState> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null) return AppState();
    return AppState.fromJson(jsonDecode(raw));
  }

  static Future<void> save(AppState state) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(state.toJson()));
  }

  static String getTodayKey() {
    final now = DateTime.now();
    return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
  }

  static DayTasks? getTodayTasks(AppState state) {
    final today = getTodayKey();
    try {
      return state.days.firstWhere((d) => d.date == today);
    } catch (_) {
      return null;
    }
  }

  static List<DayTasks> getHistoryDays(AppState state) {
    final today = getTodayKey();
    final history = state.days.where((d) => d.date != today).toList();
    history.sort((a, b) => b.date.compareTo(a.date));
    return history;
  }
}
