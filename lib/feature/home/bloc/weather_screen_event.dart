part of 'weather_screen_bloc.dart';

class WeatherScreenEvent {}

class LoadWeatherScreen extends WeatherScreenEvent {
  final String location;

  LoadWeatherScreen({required this.location});
}
