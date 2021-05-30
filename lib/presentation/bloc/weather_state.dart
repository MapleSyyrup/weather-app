import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
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

  const WeatherLoadingSuccessState({@required this.weatherModel}) : assert(weatherModel != null);

  @override
  List<Object> get props => [weatherModel];
}

class WeatherLoadingFailureState extends WeatherState {}
