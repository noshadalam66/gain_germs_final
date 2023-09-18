import 'dart:async';
import 'package:meta/meta.dart';
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

  @override
  Stream<HomePageState> applyAsync({HomePageState? currentState,
    HomePageBloc? bloc}) async* {


  }
}