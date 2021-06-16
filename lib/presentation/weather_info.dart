import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/models/constants.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/bloc/weather_event.dart';
import 'package:weather_app/presentation/bloc/weather_state.dart';
import 'package:weather_app/presentation/widgets/weather_temp_widget.dart';
import '../data/models/weather_model.dart';
import 'package:weather_app/presentation/widgets/lastupdate_widget.dart';
import 'package:weather_app/presentation/widgets/location_widget.dart';
import 'dart:async';

///WeatherInfo displays the weather information of a city
class WeatherInfo extends StatefulWidget {
  const WeatherInfo({
    Key key,
    @required this.city,
    @required this.weatherModel,
  }) : super(key: key);

  ///the entered city of the user
  final String city;

  ///weatherModel is used for the fetched data
  final WeatherModel weatherModel;

  @override
  _WeatherInfoState createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  ///TextEditingController for searching another city
  final _enterCityAgain = TextEditingController();

  /// _focusChange is used to determine if the TextField is in focus
  bool _focusChange = false;

  ///produces future event that returns the updated weather information
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        BlocProvider.of<WeatherBloc>(context).add(
          WeatherUpdate(city: widget.weatherModel.city),
        );
        return _refreshCompleter.future;
      },
      child: BlocListener<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is WeatherLoadingSuccessState) {
            _refreshCompleter?.complete();
            _refreshCompleter = Completer();
          }
        },
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  ConstantColors.blue, //blue
                  ConstantColors.oceanBlue, //ocean blue
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
                  var borderRadius = BorderRadius.circular(30);
                  return Focus(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        // cursorColor: Color.fromRGBO(63, 193, 192, 1), will be used for UI design
                        controller: _enterCityAgain,
                        // style: TextStyle(color: Colors.white), will be used for UI design
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              context.read<WeatherBloc>().add(CityWeather(city: _enterCityAgain.text));
                            },
                            // color: _focusChange ? Color.fromRGBO(63, 193, 192, 1) : Colors.white, will be used for UI design
                          ),
                          labelText: 'Enter City',
                          // labelStyle: TextStyle(color: _focusChange ? Color.fromRGBO(63, 193, 192, 1) : Colors.white), will be used for UI design
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: borderRadius,
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: borderRadius,
                            borderSide: BorderSide(
                                // color: Color.fromRGBO(63, 193, 192, 1), will be used for UI design
                                color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                    onFocusChange: (hasFocus) {
                      ///if focus is not mounted or does not exist in the widget tree anymore, it will be returned and will not set the state
                      if (!mounted) {
                        return;
                      }
                      setState(() => _focusChange = hasFocus);
                    },
                  );
                },
              );
            },
            child: const Icon(Icons.search_outlined),
            backgroundColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
