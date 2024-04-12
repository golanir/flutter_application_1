import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  // Private constructor
  SharedPrefsService._internal();

  // Single instance
  static final SharedPrefsService _instance = SharedPrefsService._internal();

  // SharedPreferences instance
  late SharedPreferences _prefs;

  // Factory constructor
  factory SharedPrefsService() => _instance;

  // Initialize
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String? getString(String key) => _prefs.getString(key);

  Future<bool> setString(String key, String value) =>
      _prefs.setString(key, value);

  int? getInt(String key) => _prefs.getInt(key);

  Future<bool> setInt(String key, int value) => _prefs.setInt(key, value);
}
