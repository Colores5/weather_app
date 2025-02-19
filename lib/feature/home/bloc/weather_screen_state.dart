part of 'weather_screen_bloc.dart';

class WeatherScreenState {}

class WeatherScreenBlocInitial extends WeatherScreenState {}

class WeatherScreenBlocLoading extends WeatherScreenState {}

class WeatherScreenBlocLoaded extends WeatherScreenState {
  final CurrentWeather currentWeatherInfo;

  WeatherScreenBlocLoaded({required this.currentWeatherInfo});
}

class WeatherScreenBlocFailure extends WeatherScreenState {
  final Object? exception;

  WeatherScreenBlocFailure({required this.exception});
}
