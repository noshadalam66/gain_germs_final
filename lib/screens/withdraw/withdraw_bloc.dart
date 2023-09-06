import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'index.dart';

class WithdrawBloc extends Bloc<WithdrawEvent, WithdrawState> {
  WithdrawBloc(WithdrawState initialState) : super(initialState) {
    on<WithdrawEvent>((event, emit) {
      return emit.forEach<WithdrawState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'Bloc', error: error, stackTrace: stackTrace);
          return ErrorWithdrawState(error.toString());
        },
      );
    });
  }
}