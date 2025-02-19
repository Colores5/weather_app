import 'package:dio/dio.dart';
import 'package:weather_app/weather_app.dart';

class WeatherRepository {
  final Dio dio;

  WeatherRepository({required this.dio});

  Future<CurrentWeather> searchWeather(String location) async {
    const apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=';
    const key = "e2a7fcf1ddf0bbecb125d3ff82421b8e";
    var url = '$apiUrl$location&cnt=7&appid=$key&units=metric';
    final response = await dio.get(url);
    final currentWeather = CurrentWeather.fromJson(response.data);

    return currentWeather;
  }
}
