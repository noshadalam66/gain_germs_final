import 'dart:async';
import '../../Models/user_details.dart';
import 'package:meta/meta.dart';
import '../../Models/commonmodel.dart';
import 'index.dart';

@immutable
abstract class WithdrawEvent {
  Stream<WithdrawState> applyAsync(
      {WithdrawState? currentState, WithdrawBloc? bloc});
}

class UnWithdrawEvent extends WithdrawEvent {
  @override
  Stream<WithdrawState> applyAsync({WithdrawState? currentState,
    WithdrawBloc? bloc}) async* {
    yield UnWithdrawState();
  }
}

class LoadWithdrawEvent extends WithdrawEvent {

  UserResponse? userResponse;

  @override
  Stream<WithdrawState> applyAsync({WithdrawState? currentState,
    WithdrawBloc? bloc}) async* {

    userResponse = getUserDetail();

    yield ApiCardsCallBack(userResponse ?? UserResponse(responseCode: 1, responseMessage: "responseMessage"), true);

  }
}