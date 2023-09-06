import 'dart:async';
import '../../Models/user_details.dart';
import 'package:meta/meta.dart';
import '../../Models/commonmodel.dart';
import 'index.dart';

@immutable
abstract class DepositEvent {
  Stream<DepositState> applyAsync(
      {DepositState? currentState, DepositBloc? bloc});
}

class UnDepositEvent extends DepositEvent {
  @override
  Stream<DepositState> applyAsync({DepositState? currentState,
    DepositBloc? bloc}) async* {
    yield UnDepositState();
  }
}

class LoadDepositEvent extends DepositEvent {

  UserResponse? userResponse;

  @override
  Stream<DepositState> applyAsync({DepositState? currentState,
    DepositBloc? bloc}) async* {

    userResponse = getUserDetail();

    yield ApiCardsCallBack(userResponse ?? UserResponse(responseCode: 1, responseMessage: "responseMessage"), true);

  }
}