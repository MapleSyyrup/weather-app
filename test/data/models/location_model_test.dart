import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/data/models/location_model.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final locationModel = LocationModel(
    title: 'Manila',
    locationType: 'City',
    woeid: 1199477,
    lattLong: '14.609620,121.005890',
  );

  test('fromJson', () async {
    ///the test shows the correct data of lattlong
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('location.json'));
    // act
    final result = LocationModel.fromJson(jsonMap);
    // assert
    expect(result.lattLong, locationModel.lattLong);
    
  });
}