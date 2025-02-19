import 'package:json_annotation/json_annotation.dart';

part 'current_weather_main.g.dart';

@JsonSerializable()
class Main {
  final double temp;
  final int humidity;

  @JsonKey(name: 'temp_max')
  final double maxTemp;

  Main({
    required this.temp,
    required this.humidity,
    required this.maxTemp,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);
}
