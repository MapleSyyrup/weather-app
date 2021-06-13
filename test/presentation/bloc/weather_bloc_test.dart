import 'package:weather_app/data/models/models.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/bloc/weather_event.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:weather_app/presentation/bloc/weather_state.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  MockWeatherRepository mockWeatherRepository;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
  });

  group(
    'Bloc Testing',
    () {
      final weather = WeatherModel(
        condition: WeatherCondition.heavyCloud,
        city: 'Manila',
        locationId: 1199477,
        temperature: 34.31,
        dateUpdated: DateTime.now(),
      );
      blocTest(
        'BlocTest',
        build: () {
          when(mockWeatherRepository.getWeather(any)).thenAnswer((_) async => weather);
          return WeatherBloc(weatherRepository: mockWeatherRepository);
        },
        act: (bloc) => bloc.add(CityWeather(city: 'Manila')),
        expect: () => [
          WeatherLoadingState(),
          WeatherLoadingSuccessState(weatherModel: weather),
        ],
      );
    },
  );
}
