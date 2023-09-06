import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'index.dart';

class RollBloc extends Bloc<RollEvent, RollState> {
  RollBloc(RollState initialState) : super(initialState) {
    on<RollEvent>((event, emit) {
      return emit.forEach<RollState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'Bloc', error: error, stackTrace: stackTrace);
          return ErrorRollState(error.toString());
        },
      );
    });
  }
}