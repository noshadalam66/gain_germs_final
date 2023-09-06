import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'index.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  DepositBloc(DepositState initialState) : super(initialState) {
    on<DepositEvent>((event, emit) {
      return emit.forEach<DepositState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'Bloc', error: error, stackTrace: stackTrace);
          return ErrorDepositState(error.toString());
        },
      );
    });
  }
}