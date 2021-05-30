import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather_app/data/models/models.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/bloc/weather_state.dart';
import 'package:weather_app/presentation/initial_weather_screen.dart';
import 'package:weather_app/presentation/widgets/location_widget.dart';

class WeatherScreen extends StatefulWidget {
  static const routeName = '/WeatherScreen';
  final String city;

  const WeatherScreen({Key key, this.city}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      if (state is WeatherInitialState) {
        return InitialWeather();
      } else if (state is WeatherLoadingState) {
        return Center(child: CircularProgressIndicator());
      } else if (state is WeatherLoadingSuccessState) {
        return WeatherInfo(city: state.weatherModel.city);
      } else {
        return InitialWeather();
      }
    });
  }
}

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    Key key,
    @required this.city,
  }) : super(key: key);

  final String city;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: EdgeInsets.only(top: 100.0),
        child: Center(
          child: Location(city: city),
        ),
      ),
      // Center(child: LastUpdated(dateTime: ),),
      // Padding(padding: EdgeInsets.symmetric(vertical: 50.0),
      // child: Center(child: CombinedWeatherTemperature()),),
    ]);
  }
}
