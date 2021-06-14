import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/bloc/weather_state.dart';
import 'package:weather_app/presentation/initial_weather_screen.dart';
import 'package:weather_app/presentation/weather_info.dart';

///WeatherScreen builds which state should be displayed
class CurrentWeatherScreen extends StatefulWidget {
  static const routeName = '/WeatherScreen';

  const CurrentWeatherScreen({Key key}) : super(key: key);

  @override
  _CurrentWeatherScreenState createState() => _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends State<CurrentWeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is WeatherLoadingSuccessState) {
          return WeatherInfo(
            city: state.weatherModel.city,
            weatherModel: state.weatherModel,
          );
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
