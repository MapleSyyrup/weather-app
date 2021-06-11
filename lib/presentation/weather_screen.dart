import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/bloc/weather_state.dart';
import 'package:weather_app/presentation/initial_weather_screen.dart';
import 'package:weather_app/presentation/weather_info.dart';

class WeatherScreen extends StatefulWidget {
  static const routeName = '/WeatherScreen';

  const WeatherScreen({Key key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is WeatherLoadingSuccessState) {
          return WeatherInfo(city: state.weatherModel.city, weatherModel: state.weatherModel,);
        } else if (state is WeatherLoadingFailureState) {
          return Center(
            child: Text('${state.errorMessage}'),
          );
        } else {
          return InitialWeather();
        }
      },
    );
  }
}


