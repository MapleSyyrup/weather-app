import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/data/models/weather_model.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final weatherModel = WeatherModel(
    condition: WeatherCondition.heavyCloud,
    city: 'Manila',
    locationId: 1199477,
    temperature: 32.745000000000005,
  );

  test('from Json', () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('weather.json'));
    // act
    final result = WeatherModel.fromJson(jsonMap);
    // assert
    expect(result, weatherModel);
  });
}
