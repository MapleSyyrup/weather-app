import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/data/models/router.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/presentation/bloc/theme_cubit.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/bloc/weather_state.dart';
import 'package:weather_app/presentation/initial_weather_screen.dart';
import 'package:weather_app/presentation/weather_observer.dart';
import 'package:weather_app/presentation/current_weather_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = WeatherObserver();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getTemporaryDirectory());
  final WeatherRepository weatherRepository = WeatherRepository(
    weatherRepositoryImpl: WeatherRepositoryImpl(
      httpClient: http.Client(),
    ),
  );

  runApp(MyApp(weatherRepository: weatherRepository));
}

class MyApp extends StatefulWidget {
  final WeatherRepository weatherRepository;

  MyApp({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(weatherRepository: widget.weatherRepository),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, Color>(
        builder: (context, color) {
          return MaterialApp(
            title: 'Weather Today',
            theme: ThemeData(
              primaryColor: color,
            ),
            home: BlocListener<WeatherBloc, WeatherState>(
              listener: (context, state) {
                if (state is WeatherLoadingState) {
                  Navigator.of(context).pushNamed(CurrentWeatherScreen.routeName);
                }
                // if (state is WeatherLoadingSuccessState) {
                //   context.read<ThemeCubit>().updateTheme(state.weatherModel);
                // }
              },
              child: InitialWeather(),
            ),
            onGenerateRoute: Routers.generateRoute,
          );
        },
      ),
    );
    // return RepositoryProvider.value(
    //   value: widget.weatherRepository,
    //   child: BlocProvider(
    //     create: (_) => ThemeCubit(),
    //     child: MaterialApp(
    //       title: 'Weather Today',
    //       theme: ThemeData(
    //         primarySwatch: Colors.blue,
    //       ),
    //       home: Center(),

    //     ),
    // child: MaterialApp(
    //   title: 'Weather Today',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: BlocListener<WeatherBloc, WeatherState>(
    //     listener: (context, state) {
    //       if (state is WeatherLoadingState) {
    //         Navigator.of(context).pushNamed(CurrentWeatherScreen.routeName);
    //       }
    //     },
    //     child:
    //     InitialWeather(),
    //   ),
    //   onGenerateRoute: Routers.generateRoute,
    // ),
    // WeatherBloc(weatherRepository: widget.weatherRepository),
    // child: BlocBuilder<ThemeCubit, Color>(
    //   builder: (context, color) {
    //     return MaterialApp(
    //       title: 'Weather Today',
    //       theme: ThemeData(
    //         primarySwatch: Colors.blue,
    //       ),
    //       home: BlocListener<WeatherBloc, WeatherState>(
    //         listener: (context, state) {
    //           if (state is WeatherLoadingState) {
    //             Navigator.of(context).pushNamed(CurrentWeatherScreen.routeName);
    //           }
    //         },
    //         child: InitialWeather(),
    //       ),
    //       onGenerateRoute: Routers.generateRoute,
    //     );
    //   },
    // ),
    //   ),
    // );
  }
}
