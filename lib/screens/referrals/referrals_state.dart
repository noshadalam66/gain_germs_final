import '../../Models/user_details.dart';
import 'package:equatable/equatable.dart';
// import 'package:qib/Models/myProducts/my_cards_model.dart';

abstract class ReferralsState extends Equatable {

  final List? propss;
  const ReferralsState([this.propss]);

  @override
  List<Object?> get props => (propss ?? []);
}

class ApiCardsCallBack extends ReferralsState {
  UserResponse userResponse;
  // Map cardInfoList;
  bool showData;
  ApiCardsCallBack(this.userResponse,this.showData) : super([userResponse,showData]);
  // const ApiCardsCallBack() : super();
  @override
  String toString() => 'ApiCardsCallBack';
}

/// UnInitialized
class UnReferralsState extends ReferralsState {

  const UnReferralsState();

  @override
  String toString() => 'UnReferralsState';
}

/// Initialized
class InReferralsState extends ReferralsState {
  final String hello;

  InReferralsState(this.hello) : super([hello]);

  @override
  String toString() => 'InReferralsState $hello';

}

class ErrorReferralsState extends ReferralsState {
  final String errorMessage;

  ErrorReferralsState(this.errorMessage): super([errorMessage]);

  @override
  String toString() => 'ErrorReferralsState';
}