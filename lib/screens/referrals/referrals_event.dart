import 'dart:async';
import '../../Models/user_details.dart';
import 'package:meta/meta.dart';
import '../../Models/commonmodel.dart';
import 'index.dart';

@immutable
abstract class ReferralsEvent {
  Stream<ReferralsState> applyAsync(
      {ReferralsState? currentState, ReferralsBloc? bloc});
}

class UnReferralsEvent extends ReferralsEvent {
  @override
  Stream<ReferralsState> applyAsync({ReferralsState? currentState,
    ReferralsBloc? bloc}) async* {
    yield UnReferralsState();
  }
}

class LoadReferralsEvent extends ReferralsEvent {

  UserResponse? userResponse;

  @override
  Stream<ReferralsState> applyAsync({ReferralsState? currentState,
    ReferralsBloc? bloc}) async* {

    userResponse = getUserDetail();

    yield ApiCardsCallBack(userResponse ?? UserResponse(responseCode: 1, responseMessage: "responseMessage"), true);

  }
}