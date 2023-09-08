import 'dart:async';

import '../../Theme/theme.dart';
import '../../Models/lottery_prizes.dart';
import '../../Models/user_details.dart';
import '../../screens/lottery/index.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/constants.dart';
import '../../header/header.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../constants/app_constant.dart';
import '../../Models/commonmodel.dart';
import '../../helper/shared_preferences.dart';
import 'lottery_event.dart';
import '../../routes/route_delegate.dart';
import '../../routes/route_handeler.dart';
String days = "", hours = "", minutes = "", seconds = "";

class LotteryScreen extends StatefulWidget {


  const LotteryScreen({
    Key? key,
    required LotteryBloc lotteryBloc,
  })  : _lotteryBloc = lotteryBloc,
        super(key: key);


  final LotteryBloc _lotteryBloc;

  @override
  LotteryScreenState createState() {
    return LotteryScreenState();
  }
}


class LotteryScreenState extends State<LotteryScreen> {
  int myNoOfTickets = 1;
  int price = 0;
  double winChance = 0.01;
  double totalWinChance = 0.01;


  UserResponse? userResponse;
  bool isApiCall = true;
  bool showData = false;

  bool isLotteryDateIsFutureDate = false;

  Timer? countdownTimer;
  Duration myDuration = Duration(seconds: lotteryTime);

  @override
  initState() {
    super.initState();
    _load();

    getBoolValuesSF(isLoggedIn).then((value) => {
      if (!value){AppRouterDelegate().setPathName(RouteData.login.name, loggedIn: false)}
    });
    // html.window.history.pushState({}, '', '/lottery');
  }

  void _load(){
    widget._lotteryBloc.add(LoadLotteryEvent());
  }

  void setValue(UserResponse ur, bool sd){
    setUserDetail(ur);
    userResponse = ur;
    isApiCall = false;
    showData = sd;

    countDownTimer();
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

  countDownTimer() {
    if(userResponse?.customerData?.drawDate != ""){
      DateTime dt1 = DateTime.parse(userResponse?.customerData?.drawDate ?? "");
      int drawDateMilliseconds = dt1.millisecondsSinceEpoch;

      int currentMilliseconds = DateTime.now().millisecondsSinceEpoch;
      double currentSeconds = currentMilliseconds / 1000;

      double drawDateSeconds = (drawDateMilliseconds / 1000);

      //current time we will consider as past bcz draw date will future date
      double differenceInSeconds = drawDateSeconds - currentSeconds;
      if (differenceInSeconds > 0 && isLotteryDateIsFutureDate == false) {
        isLotteryDateIsFutureDate = true;
        int checkInt = differenceInSeconds.toInt();
        continueTimer(checkInt);
      }
    }
  }

  void continueTimer(int seconds) {
    setState(() => myDuration = Duration(seconds: seconds));

    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 3
  void startTimer() {
    myDuration = Duration(seconds: rollTime);
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
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


  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    price = int.parse(userResponse?.customerData?.ticketPrice ?? "0");

    String strDigits(int n) => n.toString().padLeft(2, '0');

    days = strDigits(myDuration.inDays.remainder(31));
    hours = strDigits(myDuration.inHours.remainder(24));
    minutes = strDigits(myDuration.inMinutes.remainder(60));
    seconds = strDigits(myDuration.inSeconds.remainder(60));

    totalWinChance = int.parse(userResponse?.customerData?.total_ticket ?? "1") / 100;

    return BlocConsumer<LotteryBloc, LotteryState>(
        bloc: widget._lotteryBloc,
        listener: (BuildContext context,
            LotteryState currentState,) {
          if (currentState is UnLotteryState) {
            isApiCall = true;
          }
          if (currentState is ErrorLotteryState) {
            isApiCall = false;
            // errorHandling(currentState.errorMessage);
          }
          if (currentState is InLotteryState) {
            isApiCall = false;
          }
          if (currentState is ApiCardsCallBack) {
            userResponse = currentState.userResponse;
            if(userResponse?.customerData == null){
              getCDFromSF().then((value) => {
                setValue(value!, currentState.showData)
              });
            }else{
              isApiCall = false;
              showData = currentState.showData;
              countDownTimer();
            }
            print("userResponse - ${userResponse}");
          }
          if (currentState is ApiCardsCallBackForEnroll) {
            userResponse = currentState.userResponse;
            if(userResponse?.responseCode == 1){
              isApiCall = false;
              showData = currentState.showData;
            }else {
              isApiCall = false;
              showAlertDialog(context, "Error Occurred",
                userResponse?.responseMessage ?? "");
            }
          }
        },
        builder: (BuildContext context,
            LotteryState currentState,) {
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
                      "Lottery",
                      style: headingOne(_size, Colors.white),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(height: defaultPadding * 0.8),
                  _size.width > 1100
                      ? getTopLayoutInFourColumn(_size)
                      : getTopLayoutInOneColumn(_size),
                  SizedBox(height: defaultPadding * 1.2),
                  _size.width > 1100
                      ? getMiddleLayoutInTwoColumn(_size)
                      : getMiddleLayoutInOneColumn(_size),
                  SizedBox(height: defaultPadding * 1.2),
                  getLotteryHistory(_size),
                ],
              ),
            ),
          );
        });
  }

  Widget getTopLayoutInFourColumn(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: getFirstLayout(size)),
          Container(
            child: Text("\n    \n\n\n\n\n"),
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: getSecondLayout(size),
              )),
          Container(
            child: Text("\n    \n\n\n\n\n"),
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
          ),
          Expanded(flex: 3, child: getThirdLayout(size)),
          Container(
            child: Text("\n    \n\n\n\n\n"),
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
          ),
          Expanded(flex: 3, child: getFourLayout(size))
        ],
      ),
    );
  }

  Widget getTopLayoutInOneColumn(Size size) {
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
          getThirdLayout(size),
          SizedBox(
            height: defaultPadding,
            child: Container(
              decoration: BoxDecoration(
                  color: GainGermsTheme().getTheme().backGroundColor),
            ),
          ), //Expanded(flex: 8, child: getThirdLayout(size))
          getFourLayout(size),
        ],
      ),
    );
  }

  Widget getMiddleLayoutInTwoColumn(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 5, child: getFifthLayout(size)),
          Container(
            child: Text(
                "\n    \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"),
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: getSixthLayout(size),
              )),
        ],
      ),
    );
  }

  Widget getMiddleLayoutInOneColumn(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          getFifthLayout(size),
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
            child: getSixthLayout(size),
          ),
        ],
      ),
    );
  }

  Widget getFirstLayout(Size size) {
    return Container(
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
              color: primaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Image.asset(
              "assets/images/your_ticket.png",
              height: 28,
              color: primaryColor.withOpacity(0.9),
            ),
          ),
          SizedBox(height: defaultPadding / 1.5),
          Text(
            "${userResponse?.customerData?.yourTicket}",
            textAlign: TextAlign.center,
            style: headingOne(size, Colors.white),
          ),
          SizedBox(height: defaultPadding / 2),
          Text(
            "Your Tickets",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }

  Widget getSecondLayout(Size size) {
    return Container(
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
              color: Colors.cyan.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Image.asset(
              "assets/images/percentage.png",
              height: 28,
              color: Colors.cyan.withOpacity(0.9),
            ),
          ),
          SizedBox(height: defaultPadding / 1.5),
          Text(
            '${totalWinChance.toStringAsFixed(2)}%',
            textAlign: TextAlign.center,
            style: headingOne(size, Colors.white),
          ),
          SizedBox(height: defaultPadding / 2),
          Text(
            "Win Chance",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(defaultPadding * 0.7),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Image.asset(
              "assets/images/watch.png",
              height: 28,
              color: Colors.red.withOpacity(0.9),
            ),
          ),
          SizedBox(height: defaultPadding / 1.5),
          Text(
            isLotteryDateIsFutureDate ? '${days}:${hours}:${minutes}:${seconds}' :
            '00:00:00:00',
            textAlign: TextAlign.center,
            style: headingOne(size, Colors.white),
          ),
          SizedBox(height: defaultPadding / 2),
          Text(
            "Result In",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }

  Widget getFourLayout(Size size) {
    return Container(
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
              color: Colors.green.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Image.asset(
              "assets/images/document.png",
              height: 28,
              color: Colors.green.withOpacity(0.9),
            ),
          ),
          SizedBox(height: defaultPadding / 1.5),
          Text(
            "${userResponse?.customerData?.remainingTicket}",
            textAlign: TextAlign.center,
            style: headingOne(size, Colors.white),
          ),
          SizedBox(height: defaultPadding / 1.5),
          Text(
            "Tickets Left",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }

  Widget getFifthLayout(Size size) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Buy Tickets",
            style: headingOne(size, Colors.white),
          ),
          SizedBox(height: defaultPadding),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.only(

                            top: defaultPadding/4,
                            bottom: defaultPadding/4)),
                    backgroundColor: MaterialStateProperty.all(
                        GainGermsTheme().getTheme().buttonColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultPadding / 2),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if(myNoOfTickets>1){
                      setState(() {
                        myNoOfTickets = myNoOfTickets-1;
                        price = myNoOfTickets * int.parse(userResponse?.customerData?.ticketPrice ?? "0");
                        winChance = myNoOfTickets / 100;
                      });
                    }
                  },
                  child: Text('-'),
                ),
                SizedBox(
                  width: 60,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      enabled: false,
                      hintText: "${myNoOfTickets}",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.only(
                            top: defaultPadding/4,
                            bottom: defaultPadding/4)),
                    backgroundColor: MaterialStateProperty.all(
                        GainGermsTheme().getTheme().buttonColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultPadding / 2),
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      int ag = int.parse(userResponse?.customerData?.availableGains ?? "0");
                      int check = myNoOfTickets+1;
                      if(ag > check*10){
                        myNoOfTickets = myNoOfTickets+1;
                        price = myNoOfTickets * int.parse(userResponse?.customerData?.ticketPrice ?? "0");
                        winChance = myNoOfTickets / 100;
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You don not have enough germs to buy more tickets")));
                      }
                    });
                  },
                  child: Text('+'),
                )
              ],
            ),
          ),
          SizedBox(height: defaultPadding),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20, left: 12),
                  decoration: BoxDecoration(
                    color: GainGermsTheme().getTheme().backGroundColor,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                  ),
                  child: Text(
                    "Price",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: TextField(
                  decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.money, color: Colors.grey),
                    hintText: "${int.parse(userResponse?.customerData?.ticketPrice ?? "0")}" + " " + "Germs",
                    enabled: false,
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: defaultPadding),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: GainGermsTheme().getTheme().backGroundColor,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                  ),
                  child: Text(
                    "Min Win Chance",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.white,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextField(
                  // keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabled: false,
                    // prefixIcon: Icon(Icons.email, color: Colors.grey),
                    hintText: "${winChance}"+"%",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: defaultPadding),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: GainGermsTheme().getTheme().backGroundColor,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                  ),
                  child: Text(
                    "Available Balance",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabled: false,
                    // prefixIcon: Icon(Icons.person, color: Colors.white),
                    hintText: "${userResponse?.customerData?.availableGains}" +
                        " " +
                        "Germs",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: defaultPadding * 1.5,
          ),
          ElevatedButton(
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
              setState(() {
                isApiCall = true;
              });

              // Validate returns true if the form is valid, or false otherwise.
              int lotteryBoughtTime = DateTime.now().millisecondsSinceEpoch;
              widget._lotteryBloc.add(EnrollLotteryToServer(lotteryBoughtTime.toString(),
                int.parse(userResponse?.customerData?.userLevel ?? "1"),
                int.parse(userResponse?.customerData?.userLevelPoints ?? "1"),
                userResponse?.customerData?.id ?? "1",
                myNoOfTickets.toString(),
                userResponse?.customerData?.lotteryId ?? "1",
                userResponse?.customerData?.ticketPrice ?? "1"));
            },
            child: Text("Buy!"),
          )
        ],
      ),
    );
  }

  Widget getSixthLayout(Size size) {
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
            "Prizes",
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
                columnSpacing: 40, //defaultPadding,
                // minWidth: 600,
                columns: [
                  DataColumn(
                    label: Text("Position",
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
                  lotteryWinnersPrizeTable.length,
                  (index) => prizesDataRow(
                      lotteryWinnersPrizeTable[index], context, index),
                ),
              ),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
        ],
      ),
    );
  }


  DataRow prizesDataRow(
      LotteryPrizedWinnerTable fileInfo, BuildContext context, int index) {
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

  Widget getLotteryHistory(Size size) {
    List lotteries = [];
    int limit = userResponse?.customerData?.lotteries?.length ?? 0;
    for (int i = 0; i < limit; i++) {
      lotteries.add(userResponse?.customerData?.lotteries![i]);
    }

    return Container(
      // color: GainGermsTheme().getTheme().backGroundColor.withOpacity(0.9),
      // padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(defaultPadding),
            child: Text(
              "Last 5 Rounds",
              style: headingOne(size, Colors.white),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: MaterialStateColor.resolveWith((states) =>
                    GainGermsTheme().getTheme().backGroundColor.withOpacity(0.5)),
                columnSpacing: 40, //defaultPadding,
                // minWidth: 600,
                columns: [
                  DataColumn(
                    label: Text("Lottery Round",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text("Tickets",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text("Status",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text("Won Tickets",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text("Won Amount",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
                rows: List.generate(
                  lotteries.length,
                  (index) =>
                      lotteryDataRow(lotteries[index], context, index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow lotteryDataRow(Lotteries lottery, BuildContext context, int index) {
    return DataRow(
      cells: [
        DataCell(
          Text(lottery.winnerAmount ?? "",
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.white)),
        ),
        DataCell(
          Text(lottery.ticketNo ?? "",
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.white)),
        ),
        DataCell(Text(lottery.ticketNo ?? "",
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.white))),
        DataCell(Text(lottery.winnerPosition ?? "",
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.white))),
        DataCell(Text(lottery.winnerAmount!,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.white))),
      ],
    );
  }
}
