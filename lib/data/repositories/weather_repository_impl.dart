import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/data/models/models.dart';

class WeatherRepositoryImpl {
  static const baseUrl = 'https://www.metaweather.com';
  final http.Client httpClient;

  WeatherRepositoryImpl({@required this.httpClient})
      : assert(httpClient != null);

  // TODO: This contains Http Error, might need API key from your registered account here. Please read docs on metaweather for proper implementation of API call.
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

  Future<WeatherModel> fetchWeather(int locationId) async {
    final weatherUrl = Uri.parse('$baseUrl/api/location/$locationId');
    final weatherResponse = await http.get(weatherUrl);

    final weatherData = json.decode(weatherResponse.body);
    return WeatherModel.fromJson(weatherData);
  }
}
