import 'dart:async';
import '../../Models/user_details.dart';
import 'package:meta/meta.dart';
import '../../Models/commonmodel.dart';
import 'index.dart';

@immutable
abstract class UserLevelEvent {
  Stream<UserLevelState> applyAsync(
      {UserLevelState? currentState, UserLevelBloc? bloc});
}

class UnUserLevelEvent extends UserLevelEvent {
  @override
  Stream<UserLevelState> applyAsync({UserLevelState? currentState,
    UserLevelBloc? bloc}) async* {
    yield UnUserLevelState();
  }
}

class LoadUserLevelEvent extends UserLevelEvent {

  UserResponse? userResponse;

  @override
  Stream<UserLevelState> applyAsync({UserLevelState? currentState,
    UserLevelBloc? bloc}) async* {

    userResponse = getUserDetail();

    yield ApiCardsCallBack(userResponse ?? UserResponse(responseCode: 1, responseMessage: "responseMessage"), true);

  }
}