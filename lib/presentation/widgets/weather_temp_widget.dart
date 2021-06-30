import 'package:flutter/material.dart';
import 'package:weather_app/data/models/weather_model.dart' as model;
import 'package:weather_app/presentation/widgets/temperature_widget.dart';
import 'package:weather_app/presentation/widgets/weather_condition_widget.dart';

///UI design for weather temperature
class WeatherTemperature extends StatelessWidget {
  final model.WeatherModel weatherModel;
  const WeatherTemperature({Key key, @required this.weatherModel})
      : assert(weatherModel != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: WeatherConditions(weatherCondition: weatherModel.condition),
        ),
        Padding(
          padding: EdgeInsets.only(left: 140),
          child: Temperature(
            temperature: weatherModel.temperature,
            lowTemp: weatherModel.minTemp,
            highTemp: weatherModel.maxTemp,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            weatherModel.weatherType,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
