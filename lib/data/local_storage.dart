import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPreferences? _prefs;
  static final SharedPrefs _instance = SharedPrefs._();

  factory SharedPrefs() => _instance;

  SharedPrefs._() {
    init();
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
