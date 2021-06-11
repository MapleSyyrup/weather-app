import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/bloc/weather_event.dart';
import 'package:weather_app/presentation/bloc/weather_state.dart';
import 'package:weather_app/presentation/widgets/weather_temp_widget.dart';
import '../data/models/weather_model.dart';
import 'package:weather_app/presentation/widgets/lastupdate_widget.dart';
import 'package:weather_app/presentation/widgets/location_widget.dart';

class WeatherInfo extends StatefulWidget {
  const WeatherInfo({
    Key key,
    @required this.city,
    @required this.weatherModel,
  }) : super(key: key);

  final String city;
  final WeatherModel weatherModel;

  @override
  _WeatherInfoState createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  final _enterCityAgain = TextEditingController();
  bool _focusChange = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherBloc, WeatherState>(
      listener: (context, state) {},
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(45, 181, 223, 1), //blue
                Color.fromRGBO(32, 129, 159, 1), //ocean blue
              ],
            ),
          ),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Center(
                  child: Location(city: widget.city),
                ),
              ),
              Center(
                child: LastUpdate(dateTime: widget.weatherModel.dateUpdated),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Center(
                  child: WeatherTemperature(
                    weatherModel: widget.weatherModel,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            return showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return Focus(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      // cursorColor: Color.fromRGBO(63, 193, 192, 1),
                      controller: _enterCityAgain,
                      // style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            context.read<WeatherBloc>().add(CityWeather(city: _enterCityAgain.text));
                          },
                          // color: _focusChange ? Color.fromRGBO(63, 193, 192, 1) : Colors.white,
                        ),
                        labelText: 'Enter City',
                        // labelStyle: TextStyle(color: _focusChange ? Color.fromRGBO(63, 193, 192, 1) : Colors.white),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                              // color: Color.fromRGBO(63, 193, 192, 1),
                              color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  onFocusChange: (hasFocus) {
                    if (!mounted) {
                      return;
                    }
                    setState(() {
                      _focusChange = hasFocus;
                    });
                  },
                );
              },
            );
          },
          child: const Icon(Icons.search_outlined),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
