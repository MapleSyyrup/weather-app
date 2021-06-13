import 'package:flutter/material.dart';
import 'package:weather_app/presentation/initial_weather_screen.dart';
import 'package:weather_app/presentation/weather_screen.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case InitialWeather.routeName:
        return MaterialPageRoute(builder: (BuildContext context) => InitialWeather());
      case WeatherScreen.routeName:
      // final cityArg = settings.arguments as String;
        return MaterialPageRoute(builder: (BuildContext context) => WeatherScreen());
      default:
        return MaterialPageRoute(builder: (BuildContext context) => InitialWeather());
    }
  }
}
