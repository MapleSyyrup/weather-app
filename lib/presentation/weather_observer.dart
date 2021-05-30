import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class WeatherObserver extends BlocObserver {
  @override
  @mustCallSuper
  void onEvent(Bloc bloc, Object event) {
    print('onEvent $event');
    super.onTransition(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
    print('onTransition $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError $error');
    super.onError(bloc, error, stackTrace);
  }
}
