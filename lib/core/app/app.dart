import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/app/bloc/main_app_bloc.dart';
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
    return BlocProvider(
      create: (context) => MainAppBloc(
        prefsRepository: getIt<PrefsRepository>(),
        themeRepository: getIt<ThemeRepository>(),
      ),
      child: BlocBuilder<MainAppBloc, MainAppState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: getIt<AppRouter>().config(),
            theme: state.theme,
          );
        },
      ),
    );
  }
}
