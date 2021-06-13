import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/data/models/models.dart';

class WeatherRepositoryImpl {
  static const baseUrl = 'https://www.metaweather.com';
  final http.Client httpClient;

  WeatherRepositoryImpl({@required this.httpClient}) : assert(httpClient != null);

  ///the getLocation passes the city that will be added to the location Url to get the locationId
  ///if the response is a success, the where on earth ID will be passed from the API
  ///if the response fails, an Exception will be thrown
  Future<int> getLocation(String city) async {
    final locationUrl = Uri.parse('$baseUrl/api/location/search/?query=$city');
    final locationResponse = await http.get(locationUrl);
    try {
      final locationData = json.decode(locationResponse.body) as List;
      return (locationData.first)['woeid'];
    } catch (error) {
      throw Exception('error getting locationId for city');
    }
  }

  ///the fetchWeather passes the locationId that will be used to the weatherUrl to fetch the weather
  ///if the response is a success, the weather information will be passed from the API
  ///if the response fails, an Exception will be thrown
  Future<WeatherModel> fetchWeather(int locationId) async {
    final weatherUrl = Uri.parse('$baseUrl/api/location/$locationId');
    final weatherResponse = await http.get(weatherUrl);
    try {
      final weatherData = json.decode(weatherResponse.body);
      return WeatherModel.fromJson(weatherData);
    } catch (error) {
      throw Exception('error getting the weather for city');
    }
  }
}
