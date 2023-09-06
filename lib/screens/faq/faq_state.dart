import '../../Models/user_details.dart';
import 'package:equatable/equatable.dart';
// import 'package:qib/Models/myProducts/my_cards_model.dart';

abstract class FaqState extends Equatable {

  final List? propss;
  const FaqState([this.propss]);

  @override
  List<Object?> get props => (propss ?? []);
}

class ApiCardsCallBack extends FaqState {
  UserResponse userResponse;
  // Map cardInfoList;
  bool showData;
  ApiCardsCallBack(this.userResponse,this.showData) : super([userResponse,showData]);
  // const ApiCardsCallBack() : super();
  @override
  String toString() => 'ApiCardsCallBack';
}

/// UnInitialized
class UnFaqState extends FaqState {

  const UnFaqState();

  @override
  String toString() => 'UnFaqState';
}

/// Initialized
class InFaqState extends FaqState {
  final String hello;

  InFaqState(this.hello) : super([hello]);

  @override
  String toString() => 'InFaqState $hello';

}

class ErrorFaqState extends FaqState {
  final String errorMessage;

  ErrorFaqState(this.errorMessage): super([errorMessage]);

  @override
  String toString() => 'ErrorFaqState';
}