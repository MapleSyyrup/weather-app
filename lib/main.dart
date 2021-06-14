import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/data/models/router.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/bloc/weather_state.dart';
import 'package:weather_app/presentation/initial_weather_screen.dart';
import 'package:weather_app/presentation/weather_observer.dart';
import 'package:weather_app/presentation/current_weather_screen.dart';

void main() {
  Bloc.observer = WeatherObserver();

  final WeatherRepository weatherRepository = WeatherRepository(
    weatherRepositoryImpl: WeatherRepositoryImpl(
      httpClient: http.Client(),
    ),
  );

  runApp(MyApp(weatherRepository: weatherRepository));
}

class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository;

  MyApp({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: weatherRepository,
      child: BlocProvider(
        create: (_) => WeatherBloc(weatherRepository: weatherRepository),
        child: MaterialApp(
          title: 'Weather Today',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: BlocListener<WeatherBloc, WeatherState>(
            listener: (context, state) {
              if (state is WeatherLoadingState) {
                Navigator.of(context).pushNamed(CurrentWeatherScreen.routeName);
              }
            },
            child: InitialWeather(),
          ),
          onGenerateRoute: Routers.generateRoute,
        ),
      ),
    );
  }
}
