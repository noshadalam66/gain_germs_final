import '../../Models/user_details.dart';
import 'package:equatable/equatable.dart';
// import 'package:qib/data/Models/myProducts/my_cards_model.dart';

abstract class HomePageState extends Equatable {

  final List? propss;
  const HomePageState([this.propss]);

  @override
  List<Object?> get props => (propss ?? []);
}

class ApiCardsCallBack extends HomePageState {
  UserResponse userResponse;
  // Map cardInfoList;
  bool showData;
  ApiCardsCallBack(this.userResponse,this.showData) : super([userResponse,showData]);
  // const ApiCardsCallBack() : super();
  @override
  String toString() => 'ApiCardsCallBack';
}

/// UnInitialized
class UnHomePageState extends HomePageState {

  const UnHomePageState();

  @override
  String toString() => 'UnHomePageState';
}

/// Initialized
class InHomePageState extends HomePageState {
  final String hello;

  InHomePageState(this.hello) : super([hello]);

  @override
  String toString() => 'InHomePageState $hello';

}

class ErrorHomePageState extends HomePageState {
  final String errorMessage;

  ErrorHomePageState(this.errorMessage): super([errorMessage]);

  @override
  String toString() => 'ErrorHomePageState';
}