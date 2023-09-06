import '../../Models/user_details.dart';
import 'package:equatable/equatable.dart';
// import 'package:qib/data/Models/myProducts/my_cards_model.dart';

abstract class DashboardState extends Equatable {

  final List? propss;
  const DashboardState([this.propss]);

  @override
  List<Object?> get props => (propss ?? []);
}


class ApiCardsCallBackForOnline extends DashboardState {
  UserResponse? userResponse;
  // Map cardInfoList;
  bool showData;
  ApiCardsCallBackForOnline(this.userResponse,this.showData) : super([userResponse,showData]);
  // const ApiCardsCallBack() : super();
  @override
  String toString() => 'ApiCardsCallBackForOnline';
}

class ApiCardsCallBack extends DashboardState {
  UserResponse? userResponse;
  // Map cardInfoList;
  bool showData;
  ApiCardsCallBack(this.userResponse,this.showData) : super([userResponse,showData]);
  // const ApiCardsCallBack() : super();
  @override
  String toString() => 'ApiCardsCallBack';
}

/// UnInitialized
class UnDashboardState extends DashboardState {

  const UnDashboardState();

  @override
  String toString() => 'UnDashboardState';
}

/// Initialized
class InDashboardState extends DashboardState {
  final String hello;

  InDashboardState(this.hello) : super([hello]);

  @override
  String toString() => 'InDashboardState $hello';

}

class ErrorDashboardState extends DashboardState {
  final String errorMessage;

  ErrorDashboardState(this.errorMessage): super([errorMessage]);

  @override
  String toString() => 'ErrorDashboardState';
}