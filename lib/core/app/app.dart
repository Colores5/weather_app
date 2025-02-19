import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/weather_app.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: getIt<AppRouter>().config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
