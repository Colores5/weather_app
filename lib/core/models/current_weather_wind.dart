import 'package:json_annotation/json_annotation.dart';

part 'current_weather_wind.g.dart';

@JsonSerializable()
class Wind {
  final int speed;

  Wind({required this.speed});

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);
}
