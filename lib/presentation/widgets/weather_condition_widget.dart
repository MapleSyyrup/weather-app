import 'package:flutter/material.dart';
import 'package:weather_app/data/models/constants.dart';
import 'package:weather_app/data/models/weather_model.dart';

///types of weather condition
class WeatherConditions extends StatelessWidget {
  ///holds the weather condition
  final WeatherCondition weatherCondition;

  const WeatherConditions({
    Key key,
    @required this.weatherCondition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => _mapConditionToImage(weatherCondition);

  Image _mapConditionToImage(WeatherCondition condition) {
    Image image;

    switch (condition) {
      case WeatherCondition.clear:
        image = Image.asset(Constants.clear);
        break;
      case WeatherCondition.hail:
        image = Image.asset(Constants.hail);
        break;
      case WeatherCondition.heavyCloud:
        image = Image.asset(Constants.heavyCloud);
        break;
      case WeatherCondition.heavyRain:
        image = Image.asset(Constants.heavyRain);
        break;
      case WeatherCondition.lightCloud:
        image = Image.asset(Constants.lightCloud);
        break;
      case WeatherCondition.lightRain:
        image = Image.asset(Constants.lightRain);
        break;
      case WeatherCondition.showers:
        image = Image.asset(Constants.showers);
        break;
      case WeatherCondition.sleet:
        image = Image.asset(Constants.sleet);
        break;
      case WeatherCondition.snow:
        image = Image.asset(Constants.snow);
        break;
      case WeatherCondition.thunderstorm:
        image = Image.asset(Constants.thunderstorm);
        break;
      case WeatherCondition.unknown:
        image = Image.asset(Constants.clear);
        break;
    }
    return image;
  }
}
