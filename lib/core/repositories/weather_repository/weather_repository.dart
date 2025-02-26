import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/weather_app.dart';

class WeatherRepository {
  final Dio dio;

  WeatherRepository({required this.dio});

  Future<CurrentWeather> searchWeather(Position currentPosition) async {
    const apiUrl = 'https://api.openweathermap.org/data/2.5/weather?';
    const key = "e2a7fcf1ddf0bbecb125d3ff82421b8e";
    var url =
        '${apiUrl}lat=${currentPosition.latitude}&lon=${currentPosition.longitude}&appid=$key&units=metric';
    final response = await dio.get(url);
    final currentWeather = CurrentWeather.fromJson(response.data);

    return currentWeather;
  }

  Future<Position> determinePosition() async {
    final bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    final currentPosition = await Geolocator.getCurrentPosition();
    return currentPosition;
  }
}
