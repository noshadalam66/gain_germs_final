import 'dart:async';
import '../../Models/user_details.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';
import '../../Models/commonmodel.dart';
import '../../helper/shared_preferences.dart';
import 'index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

@immutable
abstract class LotteryEvent {
  Stream<LotteryState> applyAsync(
      {LotteryState? currentState, LotteryBloc? bloc});
}

class UnLotteryEvent extends LotteryEvent {
  @override
  Stream<LotteryState> applyAsync({LotteryState? currentState,
    LotteryBloc? bloc}) async* {
    yield UnLotteryState();
  }
}

class LoadLotteryEvent extends LotteryEvent {

  UserResponse? userResponse;

  @override
  Stream<LotteryState> applyAsync({LotteryState? currentState,
    LotteryBloc? bloc}) async* {

    userResponse = getUserDetail();

    yield ApiCardsCallBack(userResponse ?? UserResponse(responseCode: 1, responseMessage: "responseMessage"), true);

  }
}

class EnrollLotteryToServer extends LotteryEvent{
  final String ticketBoughtTime, userId, totalBoughtTickets, lotteryId, ticketPrice;
  final int  userLevel, userLevelPoints;
  EnrollLotteryToServer(this.ticketBoughtTime, this.userLevel, this.userLevelPoints, this.userId, this.totalBoughtTickets, this.lotteryId, this.ticketPrice);

  @override
  Stream<LotteryState> applyAsync({LotteryState? currentState,
    LotteryBloc? bloc}) async* {
    var uuid = Uuid();
    String uuidString = uuid.v4().substring(0, 13);
    var uri = Uri.https('gaingerms.com', 'gainGermSit/enroll_lottrery.php');
    final response = await http.post(
      uri,
      body: <String, String>{
        'ticketBoughtTime': ticketBoughtTime,
        'userLevel': userLevel.toString(),
        'userLevelPoints': userLevelPoints.toString(),
        'userId': userId,
        'totalBoughtTickets': totalBoughtTickets,
        'lotteryId': lotteryId,
        'lotteryNo': uuidString,
        'lotteryPrice': ticketPrice
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
        setUserDetail(customerDataObj);
        setCDToSF(stringResponse);
        yield ApiCardsCallBackForEnroll(customerDataObj ?? UserResponse(responseCode: 1, responseMessage: "responseMessage"), true);
      }else{
        yield ErrorLotteryState(userResponse["responseMessage"].toString());
      }
    } else {
      yield ErrorLotteryState("Service Error");
      throw Exception('Unexpected error occured!');
    }
  }
}