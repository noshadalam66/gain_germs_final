import '../../Models/user_details.dart';
import 'package:equatable/equatable.dart';
// import 'package:qib/data/Models/myProducts/my_cards_model.dart';

abstract class SmartContractState extends Equatable {

  final List? propss;
  const SmartContractState([this.propss]);

  @override
  List<Object?> get props => (propss ?? []);
}

class ApiCardsCallBack extends SmartContractState {
  UserResponse userResponse;
  // Map cardInfoList;
  bool showData;
  ApiCardsCallBack(this.userResponse,this.showData) : super([userResponse,showData]);
  // const ApiCardsCallBack() : super();
  @override
  String toString() => 'ApiCardsCallBack';
}


/// UnInitialized
class UnSmartContractState extends SmartContractState {

  const UnSmartContractState();

  @override
  String toString() => 'UnSmartContractState';
}

/// Initialized
class InSmartContractState extends SmartContractState {
  final String hello;

  InSmartContractState(this.hello) : super([hello]);

  @override
  String toString() => 'InSmartContractState $hello';

}

class ErrorSmartContractState extends SmartContractState {
  final String errorMessage;

  ErrorSmartContractState(this.errorMessage): super([errorMessage]);

  @override
  String toString() => 'ErrorSmartContractState';
}