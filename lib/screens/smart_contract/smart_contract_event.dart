import 'dart:async';
import 'dart:convert';
import '../../Models/user_details.dart';
import 'package:meta/meta.dart';
import '../../Models/commonmodel.dart';
import '../../helper/shared_preferences.dart';
import 'index.dart';
import 'package:http/http.dart' as http;


@immutable
abstract class SmartContractEvent {
  Stream<SmartContractState> applyAsync(
      {SmartContractState? currentState, SmartContractBloc? bloc});
}

class UnSmartContractEvent extends SmartContractEvent {
  @override
  Stream<SmartContractState> applyAsync({SmartContractState? currentState,
    SmartContractBloc? bloc}) async* {
    yield UnSmartContractState();
  }
}

class LoadSmartContractEvent extends SmartContractEvent {

  UserResponse? userResponse;

  @override
  Stream<SmartContractState> applyAsync({SmartContractState? currentState,
    SmartContractBloc? bloc}) async* {

    userResponse = getUserDetail();

    yield ApiCardsCallBack(userResponse ?? UserResponse(responseCode: 1, responseMessage: "responseMessage"), true);

  }
}

class UpdateSmartContractSignedToServer extends SmartContractEvent{
  final String smartContractTime, userId;
  final int gainsEarnByLevel, winningGerms, userLevel, userLevelPoints;
  UpdateSmartContractSignedToServer(this.smartContractTime, this.userLevel, this.userLevelPoints, this.winningGerms, this.userId, this.gainsEarnByLevel);

  @override
  Stream<SmartContractState> applyAsync({SmartContractState? currentState,
    SmartContractBloc? bloc}) async* {
    var uri = Uri.https('gaingerms.com', 'gainGermSit/smart_contract.php');
    final response = await http.post(
      uri,
      body: <String, String>{
        'smartContractTime': smartContractTime,
        'userLevel': userLevel.toString(),
        'userLevelPoints': userLevelPoints.toString(),
        'winningGerms': winningGerms.toString(),
        'userId': userId,
        'gainsEarnByLevel': gainsEarnByLevel.toString(),
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
        yield ErrorSmartContractState(userResponse["responseMessage"].toString());
      }
    } else {
      yield ErrorSmartContractState("Service Error");
      throw Exception('Unexpected error occured!');
    }
  }
}