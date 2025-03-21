part of 'weather_screen_bloc.dart';

class WeatherScreenEvent {}

class LoadWeatherScreen extends WeatherScreenEvent {}

class ChangeThemeEvent extends WeatherScreenEvent {
  final ThemeStatus themeStatus;

  ChangeThemeEvent({required this.themeStatus});
}
