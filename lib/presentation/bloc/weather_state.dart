import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/data/models/models.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadingSuccessState extends WeatherState {
  final WeatherModel weatherModel;

  const WeatherLoadingSuccessState({@required this.weatherModel})
      : assert(weatherModel != null);

  @override
  List<Object> get props => [weatherModel];
}

class WeatherLoadingFailureState extends WeatherState {
  final String errorMessage;

  const WeatherLoadingFailureState(this.errorMessage)
      : assert(errorMessage != null);

  @override
  List<Object> get props => [errorMessage];
}
