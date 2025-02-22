import 'package:flutter/material.dart';
import 'package:weather_app/weather_app.dart';

final myConstants = Constants();

final lightTheme = ThemeData(
  primaryColor: myConstants.primaryColor,
  textTheme: textTheme,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: myConstants.primaryColor,
    brightness: Brightness.light,
  ),
);

final darkTheme = ThemeData(
  primaryColor: myConstants.darkPrimaryColor,
  appBarTheme: AppBarTheme(
    color: myConstants.darkSecondColor,
  ),
  textTheme: textTheme,
  useMaterial3: true,
  scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
  colorScheme: ColorScheme.fromSeed(
    seedColor: myConstants.darkPrimaryColor,
    brightness: Brightness.dark,
  ),
);

const textTheme = TextTheme(
  titleMedium: TextStyle(
    fontSize: 20,
  ),
  bodyMedium: TextStyle(
    fontSize: 16,
  ),
);
