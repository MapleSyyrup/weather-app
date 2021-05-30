import 'package:equatable/equatable.dart';

enum WeatherCondition {
  snow,
  sleet,
  hail,
  thunderstorm,
  heavyRain,
  lightRain,
  showers,
  heavyCloud,
  lightCloud,
  clear,
  unknown
}

class WeatherModel extends Equatable {
  final WeatherCondition condition;
  final String city;
  final int locationId;
  final double temperature;
  final DateTime dateUpdated;

  WeatherModel({
    this.condition,
    this.city,
    this.locationId,
    this.temperature,
    this.dateUpdated,
  });

  @override
  List<Object> get props => [
        condition,
        city,
        locationId,
        temperature,
        dateUpdated,
      ];

  /// factory constructor for creating a new User instance from a map.
  /// returns the WeatherModel from json
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final consolidatedWeather = json['consolidated_weather'][0];
    return WeatherModel(
      condition: _mapStringtoWeatherCondition(consolidatedWeather['weather_state_abbr']),
      city: json['title'],
      locationId: json['woeid'],
      temperature: consolidatedWeather['the_temp'] as double,
      dateUpdated: DateTime.now(),
    );
  }

  static WeatherCondition _mapStringtoWeatherCondition(String input) {
    WeatherCondition state;
    switch (input) {
      case 'sn':
        state = WeatherCondition.snow;
        break;
      case 'sl':
        state = WeatherCondition.sleet;
        break;
      case 'h':
        state = WeatherCondition.hail;
        break;
      case 't':
        state = WeatherCondition.thunderstorm;
        break;
      case 'hr':
        state = WeatherCondition.heavyRain;
        break;
      case 'lr':
        state = WeatherCondition.lightRain;
        break;
      case 's':
        state = WeatherCondition.showers;
        break;
      case 'hc':
        state = WeatherCondition.heavyCloud;
        break;
      case 'lc':
        state = WeatherCondition.lightCloud;
        break;
      case 'c':
        state = WeatherCondition.clear;
        break;
      default:
        state = WeatherCondition.unknown;
    }
    return state;
  }
}
