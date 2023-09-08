import 'dart:async';
import 'dart:math';
import '../../Theme/theme.dart';
import '../../Models/lucky_no_winner_table.dart';
import '../../Models/user_details.dart';
import '../../screens/roll/index.dart';
import '../../screens/roll/random_winner.dart';
import '../../screens/roll/rolling.dart';

import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../header/header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


import '../../Models/commonmodel.dart';
import '../../Models/random_winner_model.dart';
import '../../helper/shared_preferences.dart';
import '../../routes/route_delegate.dart';
import '../../routes/route_handeler.dart';
import '../../util/routes.dart';

String hours = "00", minutes = "", seconds = "";
// int winningGerms = 0;
int number = 0;
bool myRoll = false;

class RollScreen extends StatefulWidget {
  const RollScreen({
    Key? key,
    required RollBloc rollBloc,
  })  : _rollBloc = rollBloc,
        super(key: key);

  final RollBloc _rollBloc;

  @override
  RollScreenState createState() {
    return RollScreenState();
  }
}

class RollScreenState extends State<RollScreen> {
  Timer? countdownTimer;
  Duration myDuration = Duration(seconds: rollTime);
  bool isRollDoneWithinOneHour = false;
  bool isRolling = false;

  /// Timer related methods ///
  // Step 3
  void startTimer() {
    myDuration = Duration(seconds: rollTime);
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  int getRollWinGerm(int number) {
    int germs = 0;
    if (number >= 1 && number <= 940) {
      germs = 1;
    } else if (number >= 941 && number <= 960) {
      germs = 5;
    } else if (number >= 961 && number <= 980) {
      germs = 20;
    } else if (number >= 981 && number <= 990) {
      germs = 50;
    } else if (number >= 991 && number <= 999) {
      germs = 100;
    } else if (number == 1000) {
      germs = 1000;
    }

    return germs;
  }

  void startTimerForRoll() {
    myDuration = Duration(milliseconds: 2000);
    countdownTimer = Timer.periodic(
        Duration(milliseconds: 20), (_) => setCountDownForRolling());
  }

  void continueTimer(int seconds) {
    setState(() => myDuration = Duration(seconds: seconds));

    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  void resetTimer(int seconds) {
    stopTimer();
    setState(() => myDuration = Duration(seconds: seconds));
  }

  // Step 6
  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds <= 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  // Step 6
  void setCountDownForRolling() {
    final reduceSecondsBy = 20;
    setState(() {
      final milliseconds = myDuration.inMilliseconds - reduceSecondsBy;
      if (milliseconds < 20) {
        countdownTimer!.cancel();
        isRolling = false;

        var rng = Random();
        number = rng.nextInt(959);

        userResponse?.customerData?.rollNumber = number.toString();

        userResponse?.customerData?.winningGains = getRollWinGerm(int.parse(userResponse?.customerData?.rollNumber ?? "0")).toString();

        updateForRoll(int.parse(userResponse?.customerData?.winningGains ?? "0"), userResponse);

        isRollDoneWithinOneHour = true;
        myRoll = true;

        startTimer();

        int ulp = int.parse(userResponse?.customerData?.userLevelPoints ?? "1");
        int levelAward = 0;
        if (ulp == 1) {
          levelAward = int.parse(userResponse?.customerData?.levelAward ?? "4");
        }

        setState(() {
          isApiCall = true;
        });

        widget._rollBloc.add(UpdateRollToServer(
        userResponse?.customerData?.rollTime ?? "",
        int.parse(userResponse?.customerData?.userLevel ?? "1"),
        int.parse(userResponse?.customerData?.userLevelPoints ?? "1"),
        int.parse(userResponse?.customerData?.winningGains ?? "0"),
        userResponse?.customerData?.id ?? "1", levelAward,
            int.parse(userResponse?.customerData?.rollNumber ?? "0"),));

      } else {
        myDuration = Duration(milliseconds: milliseconds);
      }
    });
  }

  UserResponse? userResponse;
  bool isApiCall = true;
  bool showData = false;

  @override
  initState() {
    super.initState();
    _load();

    getBoolValuesSF(isLoggedIn).then((value) => {
      if (!value){AppRouterDelegate().setPathName(RouteData.login.name, loggedIn: false)}
    });
    // html.window.history.pushState({}, '', '/roll');

  }

  void _load() {
    widget._rollBloc.add(LoadRollEvent());
  }

  void setValue(UserResponse ur, bool sd) {
    setUserDetail(ur);
    userResponse = ur;
    isApiCall = false;
    showData = sd;
    countDownTimer();
  }

  countDownTimer() {
    if (userResponse?.customerData?.rollTime != "0") {
      int currentMilliseconds = DateTime.now().millisecondsSinceEpoch;
      double currentSeconds = currentMilliseconds / 1000;
      // rollTime coming as date not as millisecond
      int rollTimeMilliseconds = userResponse?.customerData?.rollTime == "0" ? 0 : int.parse(userResponse?.customerData?.rollTime ?? "0");
      double rollTimeSeconds = (rollTimeMilliseconds / 1000);

      double differenceInSeconds = currentSeconds - rollTimeSeconds;
      if (differenceInSeconds < rollTime && isRollDoneWithinOneHour == false) {
        //time is remaining
        isRollDoneWithinOneHour = true;
        int checkInt = differenceInSeconds.toInt();
        checkInt = rollTime - checkInt;
        continueTimer(checkInt);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    String strDigits(int n) => n.toString().padLeft(2, '0');

    minutes = strDigits(myDuration.inMinutes.remainder(60));
    seconds = strDigits(myDuration.inSeconds.remainder(60));

    return BlocConsumer<RollBloc, RollState>(
        bloc: widget._rollBloc,
        listener: (
          BuildContext context,
          RollState currentState,
        ) {
          if (currentState is UnRollState) {
            isApiCall = true;
          }
          if (currentState is ErrorRollState) {
            isApiCall = false;
            // errorHandling(currentState.errorMessage);
          }
          if (currentState is InRollState) {
            isApiCall = false;
          }
          if (currentState is ApiCardsCallBack) {
            userResponse = currentState.userResponse;
            if (userResponse?.customerData == null) {
              getCDFromSF()
                  .then((value) => {setValue(value!, currentState.showData)});
            } else {
              isApiCall = false;
              showData = currentState.showData;
              countDownTimer();
            }
            print("userResponse - ${userResponse}");
          }
        },
        builder: (
          BuildContext context,
          RollState currentState,
        ) {
          return ModalProgressHUD(
            opacity: 0.3,
            color: Colors.grey,
            progressIndicator: CircularProgressIndicator(),
            dismissible: false,
            inAsyncCall: isApiCall,
            child: SingleChildScrollView(
              primary: false,
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  Header(userResponse: userResponse),
                  SizedBox(height: defaultPadding * 1.5),
                  Container(
                    child: Text(
                      "Roll",
                      style: headingOne(_size, Colors.white),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(height: defaultPadding * 1.2),
                  _size.width > 1300
                      ? getThreeColumn(_size)
                      : _size.width < 1300 && _size.width > 800
                          ? getTwoColumn(_size)
                          : getOneColumn(_size),
                ],
              ),
            ),
          );
        });
  }

  Widget getThreeColumn(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 8, child: getFirstLayout(size)),
          Container(
            child: Text(
                "\n    \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"),
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: getSecondLayout(size),
              )),
          Container(
            child: Text(
                "\n    \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"),
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
          ),
          Expanded(flex: 8, child: getThirdLayout(size))
        ],
      ),
    );
  }

  Widget getTwoColumn(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(flex: 6, child: getFirstLayout(size)),
              Container(
                child: Text("\n    \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"),
                decoration: BoxDecoration(
                  color: GainGermsTheme().getTheme().backGroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: getSecondLayout(size),
                  )),
            ],
          ),
          SizedBox(
            height: defaultPadding,
            child: Container(
              decoration: BoxDecoration(
                  color: GainGermsTheme().getTheme().backGroundColor),
            ),
          ),
          getThirdLayout(size)
        ],
      ),
    );
  }

  Widget getOneColumn(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          getFirstLayout(size),
          SizedBox(
            height: defaultPadding,
            child: Container(
              decoration: BoxDecoration(
                  color: GainGermsTheme().getTheme().backGroundColor),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: getSecondLayout(size),
          ),
          SizedBox(
            height: defaultPadding,
            child: Container(
              decoration: BoxDecoration(
                  color: GainGermsTheme().getTheme().backGroundColor),
            ),
          ),
          getThirdLayout(size) //Expanded(flex: 8, child: getThirdLayout(size))
        ],
      ),
    );
  }

  Widget getFirstLayout(Size size) {
    return RandomWinners();
  }

  Widget getSecondLayout(Size size) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(defaultPadding),
          // decoration: BoxDecoration(
          //   color: secondaryColor,
          //   borderRadius: const BorderRadius.all(Radius.circular(10)),
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding * 0.7),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Image.asset(
                  "assets/images/graph.png",
                  height: 28,
                  color: getColorr(Random().nextInt(20)).withOpacity(0.9),//primaryColor.withOpacity(0.9),
                ),
              ),
              SizedBox(height: defaultPadding),
              Text(
                "${userResponse?.customerData?.totalGainsEarnFromSpin}" +
                    " " +
                    "Germs",
                textAlign: TextAlign.center,
                style: headingOne(size, Colors.white),
              ),
              SizedBox(height: defaultPadding / 1.5),
              Text(
                "Total Won",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white,
                    ),
              ),
              SizedBox(height: 6),
            ],
          ),
        ),
        SizedBox(
          child: Container(
            color: GainGermsTheme().getTheme().backGroundColor,
          ),
          height: defaultPadding,
        ),
        Container(
          padding: EdgeInsets.all(defaultPadding),
          // decoration: BoxDecoration(
          //   color: secondaryColor,
          //   borderRadius: const BorderRadius.all(Radius.circular(10)),
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding * 0.7),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: GainGermsTheme()
                      .getTheme()
                      .all_segments_blue
                      .withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Image.asset(
                  "assets/images/roll.png",
                  height: 28,
                  color: getColorr(Random().nextInt(20)).withOpacity(0.9),// GainGermsTheme()
                  //     .getTheme()
                  //     .all_segments_blue
                  //     .withOpacity(0.9),
                ),
              ),
              SizedBox(height: defaultPadding),
              Text(
                "${userResponse?.customerData?.totalSpinRolled}",
                textAlign: TextAlign.center,
                style: headingOne(size, Colors.white),
              ),
              SizedBox(height: defaultPadding / 1.5),
              Text(
                "Total Roll",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white,
                    ),
              ),
              SizedBox(height: 6),
            ],
          ),
        ),
        SizedBox(
          child: Container(
            color: GainGermsTheme().getTheme().backGroundColor,
          ),
          height: defaultPadding,
        ),
        Container(
          padding: EdgeInsets.all(defaultPadding),
          // decoration: BoxDecoration(
          //   color: secondaryColor,
          //   borderRadius: const BorderRadius.all(Radius.circular(10)),
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding * 0.7),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Image.asset(
                  "assets/images/watch.png",
                  height: 28,
                  color: getColorr(Random().nextInt(20)).withOpacity(0.9),
                      // GainGermsTheme().getTheme().buttonColor.withOpacity(0.9),
                ),
              ),
              SizedBox(height: defaultPadding / 1.5),

              Text(
                  isRollDoneWithinOneHour == true
                      ? '${hours}:${minutes}:${seconds}'
                      : "Time to Roll",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white,
                      )),

              SizedBox(height: defaultPadding / 2),

              Text(
                  isRollDoneWithinOneHour == true
                      ? "Next Roll"
                      : "",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.white,
                      )),
              // SizedBox(height: defaultPadding),
              // SizedBox(height: defaultPadding),
              SizedBox(height: 6),
            ],
          ),
        ),
      ],
    );
  }

  Widget getThirdLayout(Size size) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      // decoration: BoxDecoration(
      //   color: secondaryColor,
      //   borderRadius: const BorderRadius.all(Radius.circular(10)),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Free Germs",
            style: headingOne(size, Colors.white),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                  color: GainGermsTheme()
                      .getTheme()
                      .backGroundColor
                      .withOpacity(0.3)),
              child: DataTable(
                headingRowColor: MaterialStateColor.resolveWith(
                    (states) => GainGermsTheme().getTheme().backGroundColor),
                columnSpacing: 20, //defaultPadding,
                // minWidth: 600,
                columns: [
                  DataColumn(
                    label: Text("lucky number is",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text("Payout",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                  ),
                ],
                rows: List.generate(
                  luckyNumbersWinnerTable.length,
                  (index) => recentFileDataRow(
                      luckyNumbersWinnerTable[index], context, index),
                ),
              ),
            ),
          ),
          SizedBox(
            height: defaultPadding * 1.2,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(
                    left: defaultPadding * 2,
                    top: defaultPadding,
                    right: defaultPadding * 2,
                    bottom: defaultPadding)),
                backgroundColor: MaterialStateProperty.all(
                    GainGermsTheme().getTheme().buttonColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultPadding / 2),
                  ),
                ),
              ),
              onPressed: () {
                if (!isRollDoneWithinOneHour && !isRolling) {
                  isRolling = true;
                  startTimerForRoll();
                }
              },
              child: Text("Roll>>"),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Container(
            alignment: Alignment.center,
            child: isRolling == false
                ? Text(
                    isRollDoneWithinOneHour == true
                        ? "You Win" +
                            " " +
                            "${userResponse?.customerData?.winningGains}" +
                            " " +
                            "Germs"
                        : "",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                : Rolling(),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Container(
            alignment: Alignment.center,
            child: isRolling == false
                ? Text(
                    isRollDoneWithinOneHour == true
                        ? "Number" + " " + "${userResponse?.customerData?.rollNumber}"
                        : "",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold))
                : Container(),
          )
        ],
      ),
    );
  }

  DataRow recentFileDataRow(
      LuckerNumberWinnerTable fileInfo, BuildContext context, int index) {
    return DataRow(
      cells: [
        DataCell(
          Text(fileInfo.title!,
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.white)),
        ),
        DataCell(
          Text(fileInfo.winAmount!,
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.white)),
        ),
      ],
    );
  }
}
