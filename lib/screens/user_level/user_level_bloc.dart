import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'index.dart';

class UserLevelBloc extends Bloc<UserLevelEvent, UserLevelState> {
  UserLevelBloc(UserLevelState initialState) : super(initialState) {
    on<UserLevelEvent>((event, emit) {
      return emit.forEach<UserLevelState>(
        event.applyAsync(currentState: state, bloc: this),
        onData: (state) => state,
        onError: (error, stackTrace) {
          developer.log('$error', name: 'Bloc', error: error, stackTrace: stackTrace);
          return ErrorUserLevelState(error.toString());
        },
      );
    });
  }
}