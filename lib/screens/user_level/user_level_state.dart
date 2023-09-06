import '../../Models/user_details.dart';
import 'package:equatable/equatable.dart';
// import 'package:qib/data/Models/myProducts/my_cards_model.dart';

abstract class UserLevelState extends Equatable {

  final List? propss;
  const UserLevelState([this.propss]);

  @override
  List<Object?> get props => (propss ?? []);
}

class ApiCardsCallBack extends UserLevelState {
  UserResponse userResponse;
  // Map cardInfoList;
  bool showData;
  ApiCardsCallBack(this.userResponse,this.showData) : super([userResponse,showData]);
  // const ApiCardsCallBack() : super();
  @override
  String toString() => 'ApiCardsCallBack';
}

/// UnInitialized
class UnUserLevelState extends UserLevelState {

  const UnUserLevelState();

  @override
  String toString() => 'UnUserLevelState';
}

/// Initialized
class InUserLevelState extends UserLevelState {
  final String hello;

  InUserLevelState(this.hello) : super([hello]);

  @override
  String toString() => 'InUserLevelState $hello';

}

class ErrorUserLevelState extends UserLevelState {
  final String errorMessage;

  ErrorUserLevelState(this.errorMessage): super([errorMessage]);

  @override
  String toString() => 'ErrorUserLevelState';
}