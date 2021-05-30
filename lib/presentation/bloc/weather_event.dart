import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class CityWeather extends WeatherEvent {
  final String city;

  const CityWeather({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}
