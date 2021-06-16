import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

///abstract class that will be used for all possible events
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

///CityWeather is an event that passes the city entered by the user
class CityWeather extends WeatherEvent {
  final String city;

  const CityWeather({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}

///WeatherUpdate is an event for updating the weather information of a city
class WeatherUpdate extends WeatherEvent {
  ///city is the existing city that needs to be updated
  final String city;

  const WeatherUpdate({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}
