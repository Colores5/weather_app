import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/weather_app.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton(AppRouter());
  getIt.registerLazySingleton(() => WeatherRepository(dio: Dio()));
  getIt.registerLazySingleton(() => ThemeRepository());
  getIt.registerSingleton(PrefsRepository(prefs: prefs));
  runApp(const MainApp());
}
