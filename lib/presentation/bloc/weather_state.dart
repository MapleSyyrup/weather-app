import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/data/models/models.dart';

///WeatherState can be used for all possible states
abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

///Initial state when no event is happening yet
class WeatherInitialState extends WeatherState {}

///After the user enters a city, is shows a loading state while fetching weather from the API
class WeatherLoadingState extends WeatherState {}

///If fetching weather successes, weathermodel is used in success state
class WeatherLoadingSuccessState extends WeatherState {
  final WeatherModel weatherModel;

  const WeatherLoadingSuccessState({@required this.weatherModel}) : assert(weatherModel != null);

  @override
  List<Object> get props => [weatherModel];
}

///If fetching weather fails, errorMessage will be displayed
class WeatherLoadingFailureState extends WeatherState {
  final String errorMessage;

  const WeatherLoadingFailureState(this.errorMessage) : assert(errorMessage != null);

  @override
  List<Object> get props => [errorMessage];
}
