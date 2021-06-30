import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/data/models/models.dart';

class ThemeCubit extends HydratedCubit<Color> {
  ThemeCubit() : super(defaultColor);

  static const defaultColor = Color(0xFF2196F3); //blue

  void updateTheme(WeatherModel weatherModel) {
    emit(weatherModel.toColor);
    print('weather' + weatherModel.toString());
  }

  @override
  Color fromJson(Map<String, dynamic> json) {
    return Color(int.parse(json['color'] as String));
  }

  @override
  Map<String, dynamic> toJson(Color state) {
    return <String, String>{'color': '${state.value}'};
  }
}

extension on WeatherModel {
  Color get toColor {
    switch (condition) {
      case WeatherCondition.clear:
        return Colors.orangeAccent;
        break;
      case WeatherCondition.lightCloud:
        return Colors.orangeAccent;
        break;
      case WeatherCondition.hail:
        return Colors.lightBlueAccent;
        break;
      case WeatherCondition.snow:
        return Colors.lightBlueAccent;
        break;
      case WeatherCondition.sleet:
        return Colors.lightBlueAccent;
        break;
      case WeatherCondition.heavyCloud:
        return Colors.blueGrey;
        break;
      case WeatherCondition.heavyRain:
        return Colors.indigoAccent;
        break;
      case WeatherCondition.lightRain:
        return Colors.indigoAccent;
        break;
      case WeatherCondition.showers:
        return Colors.indigoAccent;
        break;
      case WeatherCondition.thunderstorm:
        return Colors.deepPurpleAccent;
        break;
      case WeatherCondition.unknown:
        return ThemeCubit.defaultColor;
        break;
      default:
        return ThemeCubit.defaultColor;
        break;
    }
  }
}
