import 'package:equatable/equatable.dart';

///types of weather conditions
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
  ///types of weather condition
  final WeatherCondition condition;

  ///city entered by the user
  final String city;

  ///where on earth id of the city
  final int locationId;

  ///weather temperature
  final double temperature;

  ///minimum weather temperature
  final double minTemp;

  ///maximum weather temperature
  final double maxTemp;

  ///date when the weather is updated
  final DateTime dateUpdated;

  ///full type of weather condition
  final String weatherType;

  WeatherModel({
    this.minTemp,
    this.maxTemp,
    this.condition,
    this.city,
    this.locationId,
    this.temperature,
    this.dateUpdated,
    this.weatherType,
  });

  @override
  List<Object> get props => [
        condition,
        city,
        locationId,
        temperature,
        minTemp,
        maxTemp,
        dateUpdated,
        weatherType,
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
      minTemp: consolidatedWeather['min_temp'] as double,
      maxTemp: consolidatedWeather['max_temp'] as double,
      weatherType: consolidatedWeather['weather_state_name'],
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
