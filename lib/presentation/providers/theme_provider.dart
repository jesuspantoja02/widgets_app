import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Estado => isDarkModeProvider = boolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Listado de colores inmutables
final colorListProvider = Provider<List<Color>>((ref) => colorList);

// Índice del color seleccionado en Theme Changer
final selectedColorProvider = StateProvider<int>((ref) => 0);

// Notifier para gestionar el estado del tema
class AppThemeNotifier extends StateNotifier<AppTheme> {
  AppThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColor(int selectedColor) {
    state = state.copyWith(selectedColor: selectedColor);
  }
}
// Provider que devuelve un objeto AppTheme
final themeNotifierProvider = StateNotifierProvider<AppThemeNotifier, AppTheme>(
  (ref) => AppThemeNotifier()
);
