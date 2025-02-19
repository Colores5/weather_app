import 'package:json_annotation/json_annotation.dart';

part 'current_weather_weatherDiscription.g.dart';

@JsonSerializable()
class WeatherDiscription {
  WeatherDiscription({
    required this.stateName,
    required this.description,
  });
  @JsonKey(name: 'main')
  final String stateName;
  final String description;

  factory WeatherDiscription.fromJson(Map<String, dynamic> json) =>
      _$WeatherDiscriptionFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDiscriptionToJson(this);
}
