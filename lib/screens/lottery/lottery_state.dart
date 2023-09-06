import '../../Models/user_details.dart';
import 'package:equatable/equatable.dart';
// import 'package:qib/Models/myProducts/my_cards_model.dart';

abstract class LotteryState extends Equatable {

  final List? propss;
  const LotteryState([this.propss]);

  @override
  List<Object?> get props => (propss ?? []);
}

class ApiCardsCallBack extends LotteryState {
  UserResponse userResponse;
  // Map cardInfoList;
  bool showData;
  ApiCardsCallBack(this.userResponse,this.showData) : super([userResponse,showData]);
  // const ApiCardsCallBack() : super();
  @override
  String toString() => 'ApiCardsCallBack';
}


class ApiCardsCallBackForEnroll extends LotteryState{
  UserResponse userResponse;
  // Map cardInfoList;
  bool showData;
  ApiCardsCallBackForEnroll(this.userResponse,this.showData) : super([userResponse,showData]);
  // const ApiCardsCallBack() : super();
  @override
  String toString() => 'ApiCardsCallBackForEnroll';
}
/// UnInitialized
class UnLotteryState extends LotteryState {

  const UnLotteryState();

  @override
  String toString() => 'UnLotteryState';
}

/// Initialized
class InLotteryState extends LotteryState {
  final String hello;

  InLotteryState(this.hello) : super([hello]);

  @override
  String toString() => 'InLotteryState $hello';

}

class ErrorLotteryState extends LotteryState {
  final String errorMessage;

  ErrorLotteryState(this.errorMessage): super([errorMessage]);

  @override
  String toString() => 'ErrorLotteryState';
}