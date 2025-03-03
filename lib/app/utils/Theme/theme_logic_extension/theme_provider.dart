import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_assignment/app/utils/Theme/theme_logic_extension/app_theme.dart';

class ThemeManager {
  static final ThemeManager _instance = ThemeManager._internal();
  factory ThemeManager() => _instance;
  ThemeManager._internal();

  static const String _themeKey = 'themeMode';
  late SharedPreferences _prefs;
  final ValueNotifier<ThemeData> themeNotifier = ValueNotifier(AppThemes.lightTheme);

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    String? savedTheme = _prefs.getString(_themeKey);

    if (savedTheme == null || savedTheme == 'system') {
      Brightness systemBrightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
      themeNotifier.value = _getThemeFromBrightness(systemBrightness);
    } else {
      themeNotifier.value = _getTheme(savedTheme);
    }
  }

  ThemeData _getTheme(String themeKey) {
    switch (themeKey) {
      case 'dark':
        return AppThemes.darkTheme;
      default:
        return AppThemes.lightTheme;
    }
  }

  ThemeData _getThemeFromBrightness(Brightness brightness) {
    return brightness == Brightness.dark ? AppThemes.darkTheme : AppThemes.lightTheme;
  }

  Future<void> setTheme(String themeKey) async {
    await _prefs.setString(_themeKey, themeKey);
    themeNotifier.value = _getTheme(themeKey);
  }

  /// **Dynamically update theme when system theme changes**
  void updateSystemTheme(Brightness brightness) {
    String? savedTheme = _prefs.getString(_themeKey);
    if (savedTheme == null || savedTheme == 'system') {
      themeNotifier.value = _getThemeFromBrightness(brightness);
    }
  }
}
