import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/models/app_state.dart';

class StorageService {
  static const _key = 'slaptask-state';
  final SharedPreferences _prefs;

  StorageService(this._prefs);

  static Future<StorageService> init() async {
    final prefs = await SharedPreferences.getInstance();
    return StorageService(prefs);
  }

  AppState load() {
    final raw = _prefs.getString(_key);
    if (raw == null) return const AppState();
    return AppState.fromJson(jsonDecode(raw));
  }

  Future<void> save(AppState state) async {
    await _prefs.setString(_key, jsonEncode(state.toJson()));
  }

  static String getTodayKey() {
    final now = DateTime.now();
    return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
  }
}