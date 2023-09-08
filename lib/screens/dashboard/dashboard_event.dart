import 'dart:async';
import '../../Models/user_details.dart';

import 'package:meta/meta.dart';
import '../../Models/commonmodel.dart';
import '../../helper/shared_preferences.dart';
import 'index.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

@immutable
abstract class DashboardEvent {
  Stream<DashboardState> applyAsync(
      {DashboardState? currentState, DashboardBloc? bloc});
}

class UnDashboardEvent extends DashboardEvent {
  @override
  Stream<DashboardState> applyAsync({DashboardState? currentState,
    DashboardBloc? bloc}) async* {
    yield UnDashboardState();
  }
}

class LoadDashboardEvent extends DashboardEvent {

  UserResponse? userResponse;

  @override
  Stream<DashboardState> applyAsync({DashboardState? currentState,
    DashboardBloc? bloc}) async* {

    userResponse = getUserDetail();

    yield ApiCardsCallBack(userResponse ?? UserResponse(responseCode: 1, responseMessage: "responseMessage"), true);


  }


}

class updateLastOnlineTimeToServer extends DashboardEvent{
  final String userId;
  final int gainsEarnByLevel, userLevel, userLevelPoints;
  updateLastOnlineTimeToServer( this.userLevel, this.userLevelPoints, this.userId, this.gainsEarnByLevel);

  @override
  Stream<DashboardState> applyAsync({DashboardState? currentState,
    DashboardBloc? bloc}) async* {
    String month = "", day = "";
    if(DateTime.now().month < 10)
      month = "0"+"${DateTime.now().month}";
    else
      month = DateTime.now().month.toString();
    if(DateTime.now().day < 10)
      day = "0"+"${DateTime.now().day}";
    else
      day = DateTime.now().day.toString();

    String date = "${DateTime.now().year}-${month}-${day}";
    var uri = Uri.https('gaingerms.com', 'gainGermSit/online.php');
    final response = await http.post(
      uri,
      body: <String, String>{
        'userLevel': userLevel.toString(),
        'userLevelPoints': userLevelPoints.toString(),
        'userId': userId,
        'gainsEarnByLevel': gainsEarnByLevel.toString(),
        'onlineTime': date,
        'onlineTimeMili': DateTime.now().millisecondsSinceEpoch.toString(),
      },
    );
    UserResponse? customerDataObj;
    if (response.statusCode == 200) {
      Map<String, dynamic> userResponse = json.decode(response.body);
      print("jsonResponse ${userResponse}");

      // responseMessage
      if (userResponse["responseCode"].toString() == "1") {
        var customerData = userResponse;//['customerData'];
        customerDataObj = UserResponse.fromJson(customerData);
        print("customerDataObj ${customerDataObj}");
        String stringResponse = jsonEncode(customerDataObj);
        ///setting userResponse to SF as string
        setCDToSF(stringResponse);
        yield ApiCardsCallBackForOnline(customerDataObj ?? UserResponse(responseCode: 1, responseMessage: "responseMessage"), true);
      }else{
        yield ErrorDashboardState(userResponse["responseMessage"].toString());
      }
    } else {
      yield ErrorDashboardState("Service Error");
      throw Exception('Unexpected error occured!');
    }
  }
}
