import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(ThemeMode.light));

  void toggleTheme(bool isDark) {
    emit(
      state.copyWith(
        themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      ),
    );
  }
}
