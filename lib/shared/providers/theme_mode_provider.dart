import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(),
);

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(_initState());

  static final _storage = GetStorage();
  static const themeModeKey = 'themeMode';

  void toggleThemeMode(bool turnDarkModeOn) {
    state = turnDarkModeOn ? ThemeMode.dark : ThemeMode.light;
    _storage.write(themeModeKey, state.name);
  }

  static ThemeMode _initState() {
    final themeModeName = _storage.read(themeModeKey);

    return ThemeMode.values.firstWhere(
      (mode) => mode.name == themeModeName,
      orElse: () => ThemeMode.light,
    );
  }
}
