import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/feature/home/bloc/cubit/theme_cubit.dart';
import 'package:weather_app/weather_app.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton(AppRouter());
  getIt.registerLazySingleton(() => WeatherRepository(dio: Dio()));
  getIt.registerSingleton<ThemeCubit>(ThemeCubit());
  runApp(const MainApp());
}
