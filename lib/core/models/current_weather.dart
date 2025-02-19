import 'package:json_annotation/json_annotation.dart';

import 'current_weather_main.dart';
import 'current_weather_weatherDiscription.dart';
import 'current_weather_wind.dart';

part 'current_weather.g.dart';

@JsonSerializable()
class CurrentWeather {
  @JsonKey(name: 'wind')
  final Wind wind;

  @JsonKey(name: 'main')
  final Main main;

  @JsonKey(name: 'weather')
  final List<WeatherDiscription> weather;

  CurrentWeather({
    required this.wind,
    required this.main,
    required this.weather,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);
}
