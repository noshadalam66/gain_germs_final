import '../../Models/user_details.dart';
import 'package:equatable/equatable.dart';
// import 'package:qib/data/Models/myProducts/my_cards_model.dart';

abstract class WithdrawState extends Equatable {

  final List? propss;
  const WithdrawState([this.propss]);

  @override
  List<Object?> get props => (propss ?? []);
}

class ApiCardsCallBack extends WithdrawState {
  UserResponse userResponse;
  // Map cardInfoList;
  bool showData;
  ApiCardsCallBack(this.userResponse,this.showData) : super([userResponse,showData]);
  // const ApiCardsCallBack() : super();
  @override
  String toString() => 'ApiCardsCallBack';
}

/// UnInitialized
class UnWithdrawState extends WithdrawState {

  const UnWithdrawState();

  @override
  String toString() => 'UnWithdrawState';
}

/// Initialized
class InWithdrawState extends WithdrawState {
  final String hello;

  InWithdrawState(this.hello) : super([hello]);

  @override
  String toString() => 'InWithdrawState $hello';

}

class ErrorWithdrawState extends WithdrawState {
  final String errorMessage;

  ErrorWithdrawState(this.errorMessage): super([errorMessage]);

  @override
  String toString() => 'ErrorWithdrawState';
}