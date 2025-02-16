import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

class MyObserver extends BlocObserver {
  final Logger logger = Logger();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.i("Bloc: ${bloc.runtimeType} --> ${change.currentState} → ${change.nextState}");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.d("Event: ${bloc.runtimeType} --> $event");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.w("Transition: ${bloc.runtimeType} --> ${transition.currentState} → ${transition.nextState}");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    logger.e("Error in ${bloc.runtimeType}: $error", error: error, stackTrace: stackTrace);
  }
}
