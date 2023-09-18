import 'dart:async';
import '../../Models/user_details.dart';
import 'package:meta/meta.dart';
import '../../Models/commonmodel.dart';
import 'index.dart';

@immutable
abstract class HomePageEvent {
  Stream<HomePageState> applyAsync(
      {HomePageState? currentState, HomePageBloc? bloc});
}

class UnHomePageEvent extends HomePageEvent {
  @override
  Stream<HomePageState> applyAsync({HomePageState? currentState,
    HomePageBloc? bloc}) async* {
    yield UnHomePageState();
  }
}

class LoadHomePageEvent extends HomePageEvent {

  UserResponse? userResponse;

  @override
  Stream<HomePageState> applyAsync({HomePageState? currentState,
    HomePageBloc? bloc}) async* {

    userResponse = getUserDetail();

    yield ApiCardsCallBack(userResponse ?? UserResponse(responseCode: 1, responseMessage: "responseMessage"), true);

  }
}