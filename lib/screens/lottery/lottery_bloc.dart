import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'index.dart';

class LotteryBloc extends Bloc<LotteryEvent, LotteryState> {
  LotteryBloc(LotteryState initialState) : super(initialState) {
    on<LotteryEvent>((event, emit) {
      return emit.forEach<LotteryState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'Bloc', error: error, stackTrace: stackTrace);
          return ErrorLotteryState(error.toString());
        },
      );
    });
  }
}