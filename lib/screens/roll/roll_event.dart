import 'dart:async';
import 'dart:convert';
import '../../Models/user_details.dart';
import 'package:meta/meta.dart';
import '../../Models/commonmodel.dart';
import '../../helper/shared_preferences.dart';
import 'index.dart';
import 'package:http/http.dart' as http;

@immutable
abstract class RollEvent {
  Stream<RollState> applyAsync(
      {RollState? currentState, RollBloc? bloc});
}

class UnRollEvent extends RollEvent {
  @override
  Stream<RollState> applyAsync({RollState? currentState,
    RollBloc? bloc}) async* {
    yield UnRollState();
  }
}

class LoadRollEvent extends RollEvent {

  UserResponse? userResponse;

  @override
  Stream<RollState> applyAsync({RollState? currentState,
    RollBloc? bloc}) async* {

    userResponse = getUserDetail();

    yield ApiCardsCallBack(userResponse ?? UserResponse(responseCode: 1, responseMessage: "responseMessage"), true);

  }
}


class UpdateRollToServer extends RollEvent{
  final String rollTime, userId;
  final int gainsEarnByLevel, winningGerms, userLevel, userLevelPoints, rollNumber;
  UpdateRollToServer(this.rollTime, this.userLevel, this.userLevelPoints, this.winningGerms, this.userId, this.gainsEarnByLevel, this.rollNumber);

  @override
  Stream<RollState> applyAsync({RollState? currentState,
    RollBloc? bloc}) async* {

    final response = await http.post(
      Uri.parse('https://gaingerms.com/gainGermSit/roll.php'),
      body: <String, String>{
        'rollTime': rollTime,
        'userLevel': userLevel.toString(),
        'userLevelPoints': userLevelPoints.toString(),
        'winningGerms': winningGerms.toString(),
        'userId': userId,
        'gainsEarnByLevel': gainsEarnByLevel.toString(),
        'rollNumber': rollNumber.toString(),
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
        yield ApiCardsCallBack(customerDataObj ?? UserResponse(responseCode: 1, responseMessage: "responseMessage"), true);
      }else{
        yield ErrorRollState(userResponse["responseMessage"].toString());
      }
    } else {
      yield ErrorRollState("Service Error");
      throw Exception('Unexpected error occured!');
    }
  }
}

