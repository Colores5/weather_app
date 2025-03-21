part of 'weather_screen_bloc.dart';

class WeatherScreenState {
  final ThemeStatus themeStatus;
  final CurrentWeather? currentWeatherInfo;

  WeatherScreenState({
    this.currentWeatherInfo,
    this.themeStatus = ThemeStatus.light,
  });

  WeatherScreenState copyWith({
    CurrentWeather? currentWeatherInfo,
    ThemeStatus? themeStatus,
  }) {
    return WeatherScreenState(
      currentWeatherInfo: currentWeatherInfo ?? this.currentWeatherInfo,
      themeStatus: themeStatus ?? this.themeStatus,
    );
  }
}

class WeatherScreenBlocFailure extends WeatherScreenState {
  final Object? exception;

  WeatherScreenBlocFailure({required this.exception});
}
