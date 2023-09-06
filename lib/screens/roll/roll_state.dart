import '../../Models/user_details.dart';
import 'package:equatable/equatable.dart';
// import 'package:qib/Models/myProducts/my_cards_model.dart';

abstract class RollState extends Equatable {

  final List? propss;
  const RollState([this.propss]);

  @override
  List<Object?> get props => (propss ?? []);
}

class ApiCardsCallBack extends RollState {
  UserResponse userResponse;
  // Map cardInfoList;
  bool showData;
  ApiCardsCallBack(this.userResponse,this.showData) : super([userResponse,showData]);
  // const ApiCardsCallBack() : super();
  @override
  String toString() => 'ApiCardsCallBack';
}

/// UnInitialized
class UnRollState extends RollState {

  const UnRollState();

  @override
  String toString() => 'UnRollState';
}

/// Initialized
class InRollState extends RollState {
  final String hello;

  InRollState(this.hello) : super([hello]);

  @override
  String toString() => 'InRollState $hello';

}

class ErrorRollState extends RollState {
  final String errorMessage;

  ErrorRollState(this.errorMessage): super([errorMessage]);

  @override
  String toString() => 'ErrorRollState';
}