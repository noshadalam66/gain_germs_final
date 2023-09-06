import '../../Models//user_details.dart';
import 'package:equatable/equatable.dart';
// import 'package:qib/Models//myProducts/my_cards_model.dart';

abstract class DepositState extends Equatable {

  final List? propss;
  const DepositState([this.propss]);

  @override
  List<Object?> get props => (propss ?? []);
}

class ApiCardsCallBack extends DepositState {
  UserResponse userResponse;
  // Map cardInfoList;
  bool showData;
  ApiCardsCallBack(this.userResponse,this.showData) : super([userResponse,showData]);
  // const ApiCardsCallBack() : super();
  @override
  String toString() => 'ApiCardsCallBack';
}

/// UnInitialized
class UnDepositState extends DepositState {

  const UnDepositState();

  @override
  String toString() => 'UnDepositState';
}

/// Initialized
class InDepositState extends DepositState {
  final String hello;

  InDepositState(this.hello) : super([hello]);

  @override
  String toString() => 'InDepositState $hello';

}

class ErrorDepositState extends DepositState {
  final String errorMessage;

  ErrorDepositState(this.errorMessage): super([errorMessage]);

  @override
  String toString() => 'ErrorDepositState';
}