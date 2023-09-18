import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'index.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc(HomePageState initialState) : super(initialState) {
    on<HomePageEvent>((event, emit) {
      return emit.forEach<HomePageState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'Bloc', error: error, stackTrace: stackTrace);
          return ErrorHomePageState(error.toString());
        },
      );
    });
  }
}