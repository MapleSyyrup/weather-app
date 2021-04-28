import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class WeatherRepositoryImpl {
  static const baseUrl = 'https://www.metaweather.com';
  final http.Client httpClient;

  WeatherRepositoryImpl({@required this.httpClient}) : assert(httpClient != null);

  Future<int> getLocation(String city) async {}
}
