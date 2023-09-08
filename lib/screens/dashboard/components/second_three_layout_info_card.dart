import 'dart:async';

import '../../../Theme/theme.dart';
import '../../../constants/app_constant.dart';
import '../../../controllers/MyMenuController.dart';
import '../../../Models//MyFiles.dart';
import '../../../Models/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/constants.dart';
import 'package:provider/provider.dart';


String hoursRoll = "00", minutesRoll = "", secondsRoll = "";
String hoursSC = "00", minutesSC = "", secondsSC = "";
class SecondThreeLayoutInfoCard extends StatefulWidget {
  const SecondThreeLayoutInfoCard({
    Key? key,
    required this.info, required this.index
  }) : super(key: key);

  final UserResponse? info;
  final int index;

  @override
  _SecondThreeLayoutInfoCardState createState() {
    return _SecondThreeLayoutInfoCardState();
  }
}

class _SecondThreeLayoutInfoCardState extends State<SecondThreeLayoutInfoCard> {
  Timer? countdownTimerRoll;
  Duration myDurationRoll = Duration(seconds: rollTime);
  // Duration myDurationSmartContract = Duration(seconds: smartContractTime);

  bool isRollDoneWithinOneHour = false;
  // bool isSCDoneWithin12Hour = false;


  // step 1
  void startTimerRoll() {
    myDurationRoll = Duration(seconds: rollTime);
    countdownTimerRoll =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDownRoll());
  }

  // // step 1
  // void startTimerSmartContract() {
  //   myDurationSmartContract = Duration(seconds: smartContractTime);
  //   countdownTimerSmartContract =
  //       Timer.periodic(Duration(seconds: 1), (_) => setCountDownSmartContract());
  // }

  // step 2
  void stopTimerRoll() {
    setState(() => countdownTimerRoll!.cancel());
  }
  //
  // // step 2
  // void stopTimerSmartContract() {
  //   setState(() => countdownTimerSmartContract!.cancel());
  // }

  // step 3
  // void resetTimerSmartContract(int seconds) {
  //   stopTimerSmartContract();
  //   setState(() => myDurationSmartContract = Duration(seconds: seconds));
  // }

  // step 3
  void resetTimerRoll(int seconds) {
    stopTimerRoll();
    setState(() => myDurationRoll = Duration(seconds: seconds));
  }

  // Step 4
  // void setCountDownSmartContract() {
  //   final reduceSecondsBy = 1;
  //   setState(() {
  //     final seconds = myDurationSmartContract.inSeconds - reduceSecondsBy;
  //     if (seconds <= 0) {
  //       countdownTimerSmartContract!.cancel();
  //     } else {
  //       myDurationSmartContract = Duration(seconds: seconds);
  //     }
  //   });
  // }

  // Step 4
  void setCountDownRoll() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDurationRoll.inSeconds - reduceSecondsBy;
      if (seconds <= 0) {
        countdownTimerRoll!.cancel();
      } else {
        myDurationRoll = Duration(seconds: seconds);
      }
    });
  }

  // countDownTimerSmartContract() {
  //   if (userResponse?.customerData?.rollTime != "0") {
  //     int currentMilliseconds = DateTime.now().millisecondsSinceEpoch;
  //     double currentSeconds = currentMilliseconds / 1000;
  //     // rollTime coming as date not as millisecond
  //     int rollTimeMilliseconds = userResponse?.customerData?.rollTime == "0" ? 0 : int.parse(userResponse?.customerData?.rollTime ?? "0");
  //     double rollTimeSeconds = (rollTimeMilliseconds / 1000);
  //
  //     double differenceInSeconds = currentSeconds - rollTimeSeconds;
  //     if (differenceInSeconds < 3600) {// && isRollDoneWithinOneHour == false
  //       //time is remaining
  //       // isRollDoneWithinOneHour = true;
  //       int checkInt = differenceInSeconds.toInt();
  //       checkInt = 3600 - checkInt;
  //       continueTimerSmartContract(checkInt);
  //     }
  //   }
  // }

  // countDownTimerRoll() {
  //   if (widget.info?.customerData?.rollTime != "0") {
  //     int currentMilliseconds = DateTime.now().millisecondsSinceEpoch;
  //     double currentSeconds = currentMilliseconds / 1000;
  //     // rollTime coming as date not as millisecond
  //     int rollTimeMilliseconds = widget.info?.customerData?.rollTime == "0" ? 0 : int.parse(widget.info?.customerData?.rollTime ?? "0");
  //     double rollTimeSeconds = (rollTimeMilliseconds / 1000);
  //
  //     double differenceInSeconds = currentSeconds - rollTimeSeconds;
  //     if (differenceInSeconds < 3600 && isRollDoneWithinOneHour == false) {//
  //       //time is remaining
  //       isRollDoneWithinOneHour = true;
  //       int checkInt = differenceInSeconds.toInt();
  //       checkInt = 3600 - checkInt;
  //       continueTimerRoll(checkInt);
  //     }
  //   }
  // }

  // void continueTimerSmartContract(int seconds) {
  //   setState(() => myDurationSmartContract = Duration(seconds: seconds));
  //
  //   countdownTimerSmartContract =
  //       Timer.periodic(Duration(seconds: 1), (_) => setCountDownSmartContract());
  // }

  void continueTimerRoll(int seconds) {
    setState(() => myDurationRoll = Duration(seconds: seconds));

    countdownTimerRoll =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDownRoll());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.info?.customerData?.rollTime != "0") {
      int currentMilliseconds = DateTime.now().millisecondsSinceEpoch;
      double currentSeconds = currentMilliseconds / 1000;
      // rollTime coming as date not as millisecond
      int rollTimeMilliseconds = widget.info?.customerData?.rollTime == "0" ? 0 : int.parse(widget.info?.customerData?.rollTime ?? "0");
      double rollTimeSeconds = (rollTimeMilliseconds / 1000);

      double differenceInSeconds = currentSeconds - rollTimeSeconds;
      if (differenceInSeconds < rollTime && isRollDoneWithinOneHour == false) {//
        //time is remaining
        isRollDoneWithinOneHour = true;
        int checkInt = differenceInSeconds.toInt();
        checkInt = rollTime - checkInt;
        continueTimerRoll(checkInt);
      }
    }

    // if (widget.info?.customerData?.smartContractTime != "0") {
    //   int currentMilliseconds = DateTime.now().millisecondsSinceEpoch;
    //   double currentSeconds = currentMilliseconds / 1000;
    //   // rollTime coming as date not as millisecond
    //   int rollTimeMilliseconds = widget.info?.customerData?.smartContractTime == "0" ? 0 : int.parse(widget.info?.customerData?.smartContractTime ?? "0");
    //   double rollTimeSeconds = (rollTimeMilliseconds / 1000);
    //
    //   double differenceInSeconds = currentSeconds - rollTimeSeconds;
    //   if (differenceInSeconds < smartContractTime && isSCDoneWithin12Hour == false) {//
    //     //time is remaining
    //     isSCDoneWithin12Hour = true;
    //     int checkInt = differenceInSeconds.toInt();
    //     checkInt = smartContractTime - checkInt;
    //     continueTimerSmartContract(checkInt);
    //   }else{
    //     isSCDoneWithin12Hour = false;
    //   }
    // }

    String strDigits(int n) => n.toString().padLeft(2, '0');

    minutesRoll = strDigits(myDurationRoll.inMinutes.remainder(60));
    secondsRoll = strDigits(myDurationRoll.inSeconds.remainder(60));

    //
    // String strDigitsSC(int n) => n.toString().padLeft(2, '0');
    // hoursSC = strDigitsSC(myDurationSmartContract.inHours.remainder(24));
    // minutesSC = strDigitsSC(myDurationSmartContract.inMinutes.remainder(60));
    // secondsSC = strDigitsSC(myDurationSmartContract.inSeconds.remainder(60));

    final navigation = Provider.of<MyMenuController>(context);
    var size = MediaQuery.of(context).size;
    String firstText = "", secondText = "", buttonText = "";
    if(widget.index == 0){
      firstText = "Invite & Earn";
      secondText = "For each Registered user you will earn 5 Germs";
      buttonText = "Go to Referrals";
    }else if(widget.index == 1){
      firstText = isRollDoneWithinOneHour == true ? "Next Roll" : "Time to Roll";
      secondText = isRollDoneWithinOneHour == true ? '${hoursRoll}:${minutesRoll}:${secondsRoll}' : "Get up-to 1000 Germs for free";
      buttonText = "Go to Roll";
    }else if(widget.index == 2){
      firstText = "Sold Out";
      secondText = "Lottery tickets left";
      buttonText = "Buy now";
    }
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: widget.index == 1 ? primaryColor : null,
        border: Border.all(color: Colors.blueAccent),
        borderRadius: const BorderRadius.all(Radius.circular(2)),
      ),
      child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Text(
              firstText,
              style: kLoginSubtitleStyle(size, Colors.white),
            ),
            Text(
              secondText,
              style: isRollDoneWithinOneHour == true ? headingTwo(size, Colors.white) : headingThree(size, Colors.white),
            ),
            ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: defaultPadding*2, top: defaultPadding, right: defaultPadding*2, bottom: defaultPadding)),
                  backgroundColor: MaterialStateProperty.all(
                      GainGermsTheme().getTheme().buttonColor),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(defaultPadding/2),
                    ),
                  ),
                ),
                onPressed: () {
                  if(widget.index == 0){//goto referrals
                    navigation.updateNavigation("referrals");
                    AppConstant.selectedIndex = 6;
                    navigation.closeMenu();
                  }else if(widget.index == 1){//goto roll
                    navigation.updateNavigation("roll");
                    AppConstant.selectedIndex = 1;
                    navigation.closeMenu();
                  }else if(widget.index == 2){//buy now lottery
                    navigation.updateNavigation("lottery");
                    AppConstant.selectedIndex = 4;
                    navigation.closeMenu();
                  }
                },
                child: Text(buttonText)),
          ]
      ),
    );
  }
}
