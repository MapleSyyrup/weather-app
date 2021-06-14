import 'package:flutter/material.dart';
import 'package:weather_app/presentation/initial_weather_screen.dart';
import 'package:weather_app/presentation/current_weather_screen.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case InitialWeather.routeName:
        return MaterialPageRoute(builder: (BuildContext context) => InitialWeather());
      case CurrentWeatherScreen.routeName:
        return MaterialPageRoute(builder: (BuildContext context) => CurrentWeatherScreen());
      default:
        return MaterialPageRoute(builder: (BuildContext context) => InitialWeather());
    }
  }
}
