import 'dart:async';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../routes/route_delegate.dart';
import '../../routes/route_handeler.dart';
import '../../Theme/theme.dart';
import '../../screens/smart_contract/index.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/constants.dart';
import '../../header/header.dart';

import '../../Models/commonmodel.dart';
import '../../Models/user_details.dart';
import '../../helper/shared_preferences.dart';

String hours = "00", minutes = "", seconds = "";

class SmartContractScreen extends StatefulWidget {

  const SmartContractScreen({
    Key? key,
    required SmartContractBloc smartContractBloc,
  })  : _smartContractBloc = smartContractBloc,
        super(key: key);


  final SmartContractBloc _smartContractBloc;

  @override
  SmartContractScreenState createState() {
    return SmartContractScreenState();
  }
}


class SmartContractScreenState extends State<SmartContractScreen> {

  UserResponse? userResponse;
  bool isApiCall = true;
  bool showData = false;
  bool isSingedContractDone = false;
  Timer? countdownTimerSmartContract;
  Duration myDurationSmartContract = Duration(seconds: smartContractTime);

  // step 1
  void startTimerSmartContract() {
    myDurationSmartContract = Duration(seconds: smartContractTime);
    countdownTimerSmartContract =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDownSmartContract());
  }

  // step 2
  void stopTimerSmartContract() {
    setState(() => countdownTimerSmartContract!.cancel());
  }

  // step 3
  void resetTimerSmartContract(int seconds) {
    stopTimerSmartContract();
    setState(() => myDurationSmartContract = Duration(seconds: seconds));
  }

  // Step 4
  void setCountDownSmartContract() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDurationSmartContract.inSeconds - reduceSecondsBy;
      if (seconds <= 0) {
        countdownTimerSmartContract!.cancel();
      } else {
        myDurationSmartContract = Duration(seconds: seconds);
      }
    });
  }

  void continueTimerSmartContract(int seconds) {
    setState(() => myDurationSmartContract = Duration(seconds: seconds));

    countdownTimerSmartContract =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDownSmartContract());
  }

  countDownTimerSmartContract() {
    if (userResponse?.customerData?.smartContractTime != "0") {
      int currentMilliseconds = DateTime.now().millisecondsSinceEpoch;
      double currentSeconds = currentMilliseconds / 1000;
      // rollTime coming as date not as millisecond
      int rollTimeMilliseconds = userResponse?.customerData?.smartContractTime == "0" ? 0 : int.parse(userResponse?.customerData?.smartContractTime ?? "0");
      double rollTimeSeconds = (rollTimeMilliseconds / 1000);

      double differenceInSeconds = currentSeconds - rollTimeSeconds;
      if (differenceInSeconds < smartContractTime && isSingedContractDone == false) {//
        //time is remaining
        isSingedContractDone = true;
        int checkInt = differenceInSeconds.toInt();
        checkInt = smartContractTime - checkInt;
        continueTimerSmartContract(checkInt);
      }
    }
  }

  @override
  initState() {
    super.initState();
    _load();

    getBoolValuesSF(isLoggedIn).then((value) => {
      if (!value){AppRouterDelegate().setPathName(RouteData.login.name, loggedIn: false)}
    });

    // html.window.history.pushState({}, '', '/smart-contract');

  }

  void _load(){
    widget._smartContractBloc.add(LoadSmartContractEvent());
  }

  void setValue(UserResponse ur, bool sd){
    setUserDetail(ur);
    userResponse = ur;
    isApiCall = false;
    showData = sd;
    countDownTimerSmartContract();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    String strDigits(int n) => n.toString().padLeft(2, '0');

    hours = strDigits(myDurationSmartContract.inHours.remainder(24));
    minutes = strDigits(myDurationSmartContract.inMinutes.remainder(60));
    seconds = strDigits(myDurationSmartContract.inSeconds.remainder(60));

    return BlocConsumer<SmartContractBloc, SmartContractState>(
        bloc: widget._smartContractBloc,
        listener: (BuildContext context,
            SmartContractState currentState,) {
          if (currentState is UnSmartContractState) {
            isApiCall = true;
          }
          if (currentState is ErrorSmartContractState) {
            isApiCall = false;
            // errorHandling(currentState.errorMessage);
          }
          if (currentState is InSmartContractState) {
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
              countDownTimerSmartContract();
            }
            print("userResponse - ${userResponse}");
          }
        },
        builder: (BuildContext context,
            SmartContractState currentState,) {
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
                      "Smart Contracts",
                      style: headingOne(_size, Colors.white),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(height: defaultPadding * 1.2),
                  _size.width > 900
                      ? getSmartContractInTwoColumn()
                      : getSmartContractInOneColumn(),
                ],
              ),
            ),
          );
        });
  }

  Widget getSmartContractInTwoColumn() {
    return Container(
      margin: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: GainGermsTheme().getTheme().layoutColor.withOpacity(0.9),
        borderRadius: const BorderRadius.all(Radius.circular(defaultPadding)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              "assets/images/smart_contract_big.png",
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              margin: EdgeInsets.only(left: defaultPadding),
              padding:
                  EdgeInsets.only(top: defaultPadding, bottom: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ASDF-NOFHO8C2J49EFJ-2-2U4F9",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    "With" + "#328u3f0",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    "Standard",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: defaultPadding),
                  Text(
                    "Taken" + ", 10.10.2023",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  SizedBox(height: defaultPadding / 2),
                  Text(
                    '+0.3 ' + "Germs for signing",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Text("\n  \n\n\n\n\n"),
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding:
                  EdgeInsets.only(top: defaultPadding, bottom: defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isSingedContractDone == true ?
                      Icon(
                        Icons.lock_clock,
                        color: Colors.white,
                        size: 30.0,
                      ) : Container(),
                      isSingedContractDone == true ? SizedBox(width: 10) :  Container(),
                      Text(isSingedContractDone == true ? '${hours}:${minutes}:${seconds}' : '4 days left',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: defaultPadding / 2),
                  Text(isSingedContractDone == true ?
                  "Next Confirmation" : '',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,),),
                  SizedBox(height: defaultPadding / 1.5),
                  isSingedContractDone == true ? Container() :
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(defaultPadding / 1.5)),
                        backgroundColor: MaterialStateProperty.all(
                            GainGermsTheme().getTheme().buttonColor),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if(!isSingedContractDone){
                          updateForSmartContractSign(gainsForSigningSmartContract, userResponse);
                          isSingedContractDone = true;
                          startTimerSmartContract();

                          int ulp = int.parse(userResponse?.customerData?.userLevelPoints ?? "1");
                          int levelAward = 0;
                          if (ulp == 1) {
                            levelAward = int.parse(userResponse?.customerData?.levelAward ?? "4");
                          }

                          widget._smartContractBloc.add(UpdateSmartContractSignedToServer(
                              userResponse?.customerData?.smartContractTime ?? "0",
                              int.parse(userResponse?.customerData?.userLevel ?? "1"),
                              int.parse(userResponse?.customerData?.userLevelPoints ?? "1"),
                              gainsForSigningSmartContract,
                              userResponse?.customerData?.id ?? "1", levelAward));

                          setState(() {
                            isApiCall = true;
                          });
                        }
                      },
                      child: Text("Sign"),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getSmartContractInOneColumn() {
    return Container(
      margin: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: GainGermsTheme().getTheme().layoutColor.withOpacity(0.9),
        borderRadius: const BorderRadius.all(Radius.circular(defaultPadding)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/smart_contract_big.png",
          ),
          SizedBox(height: defaultPadding * 2),
          Text(
            "ASDF-NOFHO8C2J49EFJ-2-2U4F9",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "With" + "#328u3f0",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Standard",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: defaultPadding),
          Text(
            "Taken" + ", 10.10.2023",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Colors.white,
            ),
          ),
          SizedBox(height: defaultPadding / 2),
          Text(
            '+0.3 ' + "Germs for signing",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Colors.white,
            ),
          ),
          SizedBox(height: defaultPadding * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_clock,
                color: Colors.white,
                size: 30.0,
              ),
              Text(
                '01:00:00',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: defaultPadding / 2),
          Text(
            "Next Confirmation",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
              color: Colors.white,
            ),
          ),
          SizedBox(height: defaultPadding / 1.5),
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.all(defaultPadding / 1.5)),
              backgroundColor: MaterialStateProperty.all(
                  GainGermsTheme().getTheme().buttonColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              // if (_formKey.currentState!.validate()) {
              //
              // }
            },
            child: Text("Sign"),
          ),
          SizedBox(height: defaultPadding * 2),
        ],
      ),
    );
  }
}
