import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'index.dart';

class ReferralsBloc extends Bloc<ReferralsEvent, ReferralsState> {
  ReferralsBloc(ReferralsState initialState) : super(initialState) {
    on<ReferralsEvent>((event, emit) {
      return emit.forEach<ReferralsState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'Bloc', error: error, stackTrace: stackTrace);
          return ErrorReferralsState(error.toString());
        },
      );
    });
  }
}