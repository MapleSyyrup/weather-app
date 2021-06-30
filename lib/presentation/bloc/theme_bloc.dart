// import 'package:bloc/bloc.dart';
// import 'package:weather_app/data/models/weather_model.dart';
// import 'package:weather_app/presentation/bloc/theme_event.dart';
// import 'package:weather_app/presentation/bloc/theme_state.dart';
// import 'package:flutter/material.dart';

// class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
//   ThemeBloc({ThemeState initialState}) : super(initialState);

//   @override
//   ThemeState get initialState => ThemeState(
//         color: Colors.lightBlue,
//         theme: ThemeData.light(),
//       );

//   @override
//   Stream<ThemeState> mapEventToState(
//     ThemeState currentState,
//     ThemeEvent event,
//   ) async* {
//     if (event is WeatherTheme) {
//       yield _mapWeatherConditionToThemeData(event.condition);
//     }
//   }

//   ThemeState _mapWeatherConditionToThemeData(WeatherCondition condition) {
//     ThemeState themeState;

//     switch (condition) {
//       case WeatherCondition.clear:
//       case WeatherCondition.lightCloud:
//         themeState = ThemeState(
//           color: Colors.yellow,
//           theme: ThemeData(primaryColor: Colors.orangeAccent),
//         );
//         break;
//       case WeatherCondition.hail:
//       case WeatherCondition.snow:
//       case WeatherCondition.sleet:
//         themeState = ThemeState(
//           color: Colors.lightBlue,
//           theme: ThemeData(primaryColor: Colors.lightBlueAccent),
//         );
//         break;
//       case WeatherCondition.heavyCloud:
//         themeState = ThemeState(
//           color: Colors.grey,
//           theme: ThemeData(primaryColor: Colors.blueGrey),
//         );
//         break;
//       case WeatherCondition.heavyRain:
//       case WeatherCondition.lightRain:
//       case WeatherCondition.showers:
//         themeState = ThemeState(
//           color: Colors.indigo,
//           theme: ThemeData(primaryColor: Colors.indigoAccent),
//         );
//         break;
//       case WeatherCondition.thunderstorm:
//         themeState = ThemeState(
//           color: Colors.deepPurple,
//           theme: ThemeData(primaryColor: Colors.deepPurpleAccent),
//         );
//         break;
//       case WeatherCondition.unknown:
//         themeState = ThemeState(
//           color: Colors.lightBlue,
//           theme: ThemeData.light(),
//         );
//         break;
//     }
//     return themeState;
//   }
// }
