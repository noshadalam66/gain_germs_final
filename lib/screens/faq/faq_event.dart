import 'dart:async';
import '../../Models/user_details.dart';
import 'package:meta/meta.dart';
import '../../Models/commonmodel.dart';
import 'index.dart';

@immutable
abstract class FaqEvent {
  Stream<FaqState> applyAsync(
      {FaqState? currentState, FaqBloc? bloc});
}

class UnFaqEvent extends FaqEvent {
  @override
  Stream<FaqState> applyAsync({FaqState? currentState,
    FaqBloc? bloc}) async* {
    yield UnFaqState();
  }
}

class LoadFaqEvent extends FaqEvent {

  UserResponse? userResponse;

  @override
  Stream<FaqState> applyAsync({FaqState? currentState,
    FaqBloc? bloc}) async* {

    userResponse = getUserDetail();

    yield ApiCardsCallBack(userResponse ?? UserResponse(responseCode: 1, responseMessage: "responseMessage"), true);

  }
}