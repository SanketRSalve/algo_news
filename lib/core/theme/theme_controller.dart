import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeControllerProvider = StateNotifierProvider<ThemeController, bool>(
  (ref) => ThemeController(),
);

class ThemeController extends StateNotifier<bool> {
  ThemeController() : super(false) {
    _loadThemePreference();
  }

  static const String _themeKey = 'isDarkMode';

  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool(_themeKey) ?? false;
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    state = !state;
    await prefs.setBool(_themeKey, state);
  }
}
