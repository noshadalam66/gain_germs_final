import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'index.dart';

class SmartContractBloc extends Bloc<SmartContractEvent, SmartContractState> {
  SmartContractBloc(SmartContractState initialState) : super(initialState) {
    on<SmartContractEvent>((event, emit) {
      return emit.forEach<SmartContractState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'Bloc', error: error, stackTrace: stackTrace);
          return ErrorSmartContractState(error.toString());
        },
      );
    });
  }
}