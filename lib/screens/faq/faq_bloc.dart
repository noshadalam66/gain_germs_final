import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'index.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  FaqBloc(FaqState initialState) : super(initialState) {
    on<FaqEvent>((event, emit) {
      return emit.forEach<FaqState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'Bloc', error: error, stackTrace: stackTrace);
          return ErrorFaqState(error.toString());
        },
      );
    });
  }
}