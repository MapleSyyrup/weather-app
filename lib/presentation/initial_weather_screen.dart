import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/models/constants.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/bloc/weather_event.dart';
import 'package:weather_app/presentation/bloc/weather_state.dart';

///InitialWeather screen is the first screen of the app when it starts
class InitialWeather extends StatefulWidget {
  static const routeName = '/initial';

  @override
  _InitialWeatherState createState() => _InitialWeatherState();
}

class _InitialWeatherState extends State<InitialWeather> {
  final _enterCity = TextEditingController();
  bool _focusChange = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherBloc, WeatherState>(
      listener: (context, state) {},
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    ConstantColors.blueGreen, //blue green
                    ConstantColors.yaleBlue, //yale blue
                  ],
                ),
              ),
            ),
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              children: [
                SizedBox(height: 100.0),
                Image.asset(
                  Constants.weatherToday,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10.0),
                Focus(
                  child: TextField(
                    cursorColor: ConstantColors.blueGreen,
                    controller: _enterCity,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          context.read<WeatherBloc>().add(CityWeather(city: _enterCity.text));
                        },
                        color: _focusChange ? ConstantColors.blueGreen : Colors.white,
                      ),
                      labelText: 'Enter City',
                      labelStyle: TextStyle(color: _focusChange ? ConstantColors.blueGreen : Colors.white),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: ConstantColors.blueGreen,
                        ),
                      ),
                    ),
                  ),
                  onFocusChange: (hasFocus) {
                    setState(() => _focusChange = hasFocus);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
