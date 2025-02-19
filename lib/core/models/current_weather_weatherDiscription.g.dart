// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_weatherDiscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDiscription _$WeatherDiscriptionFromJson(Map<String, dynamic> json) =>
    WeatherDiscription(
      stateName: json['main'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$WeatherDiscriptionToJson(WeatherDiscription instance) =>
    <String, dynamic>{
      'main': instance.stateName,
      'description': instance.description,
    };
