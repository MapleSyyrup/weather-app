import 'package:flutter/foundation.dart';
import 'package:weather_app/data/models/models.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';

class WeatherRepository {
  final WeatherRepositoryImpl weatherRepositoryImpl;

  WeatherRepository({@required this.weatherRepositoryImpl}) : assert(weatherRepositoryImpl != null);

  ///the getWeather method passes the city entered by the user
  ///getLocation will get the locationId of the city
  ///fetchWeather will pass the weather of the locationId
  Future<WeatherModel> getWeather(String city) async {
    final int locationId = await weatherRepositoryImpl.getLocation(city);
    return weatherRepositoryImpl.fetchWeather(locationId);
  }
}
