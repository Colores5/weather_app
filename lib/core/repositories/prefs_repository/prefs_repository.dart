import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/weather_app.dart';

class PrefsRepository {
  final SharedPreferences prefs;

  PrefsRepository({required this.prefs});

  static const _prefThemeKey = "theme";

  Future<void> setThemeChange(String themeStatus) async {
    await prefs.setString(_prefThemeKey, themeStatus);
  }

  String isDarkTheme() {
    final isDark = prefs.getString(_prefThemeKey);
    return isDark ?? ThemeStatus.light.toString();
  }

  ThemeStatus setThemeStatus(String themeStatus) {
    switch (themeStatus) {
      case 'light':
        return ThemeStatus.light;
      case 'dark':
        return ThemeStatus.dark;
      default:
        return ThemeStatus.light;
    }
  }
}
