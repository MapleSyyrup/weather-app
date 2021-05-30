import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/models/models.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';
import 'package:weather_app/presentation/bloc/weather_event.dart';
import 'package:weather_app/presentation/bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null),
        super(WeatherInitialState());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is CityWeather) {
      yield WeatherLoadingState();
      try {
        final WeatherModel weatherModel =
            await weatherRepository.getWeather(event.city);
        yield WeatherLoadingSuccessState(weatherModel: weatherModel);
      } catch (e) {
        yield WeatherLoadingFailureState(e.toString());
      }
    }
  }
}
