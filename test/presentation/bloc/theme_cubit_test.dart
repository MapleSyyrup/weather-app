import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/data/models/models.dart';
import 'package:weather_app/presentation/bloc/theme_cubit.dart';

import '../../helper/hydrated_bloc.dart';

class MockWeather extends Mock implements WeatherModel {
  MockWeather(this._conditions);

  final WeatherCondition _conditions;

  WeatherCondition get conditions => _conditions;
}

void main() {
  initHydratedBloc();
  group(
    'ThemeCubit',
    () {
      ThemeCubit themeCubit;

      setUp(() {
        themeCubit = ThemeCubit();
      });

      tearDown(() {
        themeCubit.close();
      });

      group('toJson/fromJson', () {
        test('work properly', () {
          expect(
            themeCubit.fromJson(themeCubit.toJson(themeCubit.state)),
            themeCubit.state,
          );
        });
      });

      group('updateTheme', () {
        final clearWeather = MockWeather(WeatherCondition.clear);
        final hailWeather = MockWeather(WeatherCondition.hail);
        final heavyCloudWeather = MockWeather(WeatherCondition.heavyCloud);
        final heavyRainWeather = MockWeather(WeatherCondition.heavyRain);
        final thunderStormWeather = MockWeather(WeatherCondition.thunderstorm);
        final unknownWeather = MockWeather(WeatherCondition.unknown);

        blocTest<ThemeCubit, Color>(
          'correct background for clear weather',
          build: () => ThemeCubit(),
          act: (cubit) => cubit.updateTheme(clearWeather),
          expect: () => <Color>[Colors.orangeAccent],
        );

        // blocTest<ThemeCubit, Color>(
        //   'correct background for hail weather',
        //   build: () => ThemeCubit(),
        //   act: (cubit) => cubit.updateTheme(hailWeather),
        //   expect: () => <Color>[Colors.lightBlueAccent],
        // );

        // blocTest<ThemeCubit, Color>(
        //   'correct background for heavy cloud weather',
        //   build: () => ThemeCubit(),
        //   act: (cubit) => cubit.updateTheme(heavyCloudWeather),
        //   expect: () => <Color>[Colors.blueGrey],
        // );

        // blocTest<ThemeCubit, Color>(
        //   'correct background for heavy rain weather',
        //   build: () => ThemeCubit(),
        //   act: (cubit) => cubit.updateTheme(heavyRainWeather),
        //   expect: () => <Color>[Colors.indigoAccent],
        // );

        // blocTest<ThemeCubit, Color>(
        //   'correct background for thunderstorm weather',
        //   build: () => ThemeCubit(),
        //   act: (cubit) => cubit.updateTheme(thunderStormWeather),
        //   expect: () => <Color>[Colors.deepPurpleAccent],
        // );

        // blocTest<ThemeCubit, Color>(
        //   'emits correct color for WeatherCondition.unknown',
        //   build: () => ThemeCubit(),
        //   act: (cubit) => cubit.updateTheme(unknownWeather),
        //   expect: () => <Color>[ThemeCubit.defaultColor],
        // );
      });
    },
  );
}
