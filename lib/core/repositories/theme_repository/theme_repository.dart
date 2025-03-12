import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weather_app/weather_app.dart';

class ThemeRepository {
  ThemeRepository();

  final _themeSubject = BehaviorSubject<ThemeStatus>();

  Stream<ThemeStatus> get themeStream => _themeSubject.stream;

  Future<void> updateTheme(ThemeStatus event) async {
    _themeSubject.add(event);
  }

  void dispose() {
    _themeSubject.close();
  }

  ThemeData getTheme(String theme) {
    switch (theme) {
      case 'light':
        return _createLightTheme();
      case 'dark':
        return _createDarkTheme();
      default:
        return _createLightTheme();
    }
  }

  static ThemeData _createLightTheme() {
    return lightTheme;
  }

  static ThemeData _createDarkTheme() {
    return darkTheme;
  }
}
