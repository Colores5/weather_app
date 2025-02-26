part of 'weather_screen_bloc.dart';

class WeatherScreenState {}

class WeatherScreenBlocInitial extends WeatherScreenState {}

// class WeatherScreenBlocLoading extends WeatherScreenState {
//   final Position currentPosition;

//   WeatherScreenBlocLoading({required this.currentPosition});
// }

class WeatherScreenBlocLoaded extends WeatherScreenState {
  final CurrentWeather currentWeatherInfo;

  WeatherScreenBlocLoaded({required this.currentWeatherInfo});
}

class WeatherScreenBlocFailure extends WeatherScreenState {
  final Object? exception;

  WeatherScreenBlocFailure({required this.exception});
}
