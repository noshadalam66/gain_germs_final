import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gain_germs_final/Theme/typography.dart';

import '../Models/commonmodel.dart';
import '../Models/user_details.dart';
import '../helper/shared_preferences.dart';


// 1 winner price 5000 gains
// 2 winner price 2500 gains
// 3 winner price 1000 gains
// 4 winner price 600 gains
// 5 winner price 300 gains
// 6 winner price 200 gains
// 7 winner price 100 gains
// 8 winner price 50 gains
// 9 winner price 20 gains
// 10 winner price 10 gains
//
// Roll and win lookup
// 1-940 => 1 gain
// 941-960 => 5 gains
// 961-980 => 20 gains
// 981-990 => 50 gains
// 991-999 => 100 gains
// 1000 => 1000 gains
//
// Lottery lookup
// We will set 1,000 tickets
// 1 ticket price will be 10 gains
// Users can buy multiple tickets
// Once all will buy than next we will held lucky draw
// There will 10 winners in initial stage
// 1 winner price 5000 gains
// 2 winner price 2500 gains
// 3 winner price 1000 gains
// 4 winner price 600 gains
// 5 winner price 300 gains
// 6 winner price 200 gains
// 7 winner price 100 gains
// 8 winner price 50 gains
// 9 winner price 20 gains
// 10 winner price 10 gains
//
// Game
// 1. All game will act as online
// 2. In game screen there will be my score and current highest score will be display with name
// 3. By end of day we will select only one will winner of the  game who has the highest score yet
// 4. Game winner will be rewarded with 50 Gains
// 5. Each game will have a its own winner
// 6. Winning Gains will be rewarded in available balance
// 7. In dashboard Add last winner of game with game title name should be display
//
//
// NOTE:
// 100 gains is equal to 1 USD
//
// Each time when scroll user will win 1 maximum gain
//
// When user complete level he/she will be rewarded with 5 gains
//
// Referral and win 10 gains when referral reaches user level 2 changed- before it was 5
//
// For each activity user level will be increased by 1 point and there will be 100 point in each level
//
// withdraw can be done when gains reaches 5,000 means with user can withdraw 50 USD minimum
//
// Jb koi game win karyga to usy 50 Gains milyngy
//
// Her game ka alag alag winner hoge
//
// smart contract sign karne ka 1 gain mily
//
// 401 Unauthorized (RFC 7235)
// 200 OK

// gainpznj_gaingerms //DB
//gainpznj_gaingerms //user
// v0ue12KQWNq0//password

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);

const defaultPadding = 16.0;

final String isLoggedIn = "isLoggedIn";

String invitedby = "";
String path = "";

final int smartContractTime = 43200;
final int rollTime = 3600;
final int lotteryTime = 2678400;
final int gainsForSigningSmartContract = 5;


TextStyle w(Size size, Color color) => GainGermsText(typo: Typo.H30, color: color, isBold: true).style();

TextStyle headingZero(Size size, Color color) => GainGermsText(typo: Typo.H0, color: color, isBold: true).style();

TextStyle headingOne(Size size, Color color) => GainGermsText(typo: Typo.H1, color: color, isBold: true).style();

TextStyle headingTwo(Size size, Color color) => GainGermsText(typo: Typo.H2, color: color, isBold: true).style();

TextStyle headingTwoNotBold(Size size, Color color) => GainGermsText(typo: Typo.H2, color: color, isBold: false).style();

TextStyle headingThree(Size size, Color color) =>
    GainGermsText(typo: Typo.H3, color: color, isBold: true).style();

TextStyle kLoginSubtitleStyle(Size size, Color color) =>
    GainGermsText(typo: Typo.H30, color: color, isBold: true).style();

TextStyle kLoginTermsAndPrivacyStyle(Size size, Color color) =>
    GainGermsText(typo: Typo.H5, color: color, isBold: true).style();

TextStyle kHaveAnAccountStyle(Size size, Color color) =>
    GainGermsText(typo: Typo.H5, color: color, isBold: true).style();

TextStyle kLoginOrSignUpTextStyle(
    Size size,
    ) =>
    GainGermsText(typo: Typo.H5, color: Colors.deepPurpleAccent, isBold: true).style();

TextStyle kLoginTitleStyle(
    Size size,Color color,
    ) =>
    GainGermsText(typo: Typo.H5, color: color, isBold: true,).style();

TextStyle kTextFormFieldStyle(Color color) => TextStyle(color: color);




// TextStyle w(Size size, Color color) => GoogleFonts.ubuntu(
//     fontSize: size.height * 0.060, fontWeight: FontWeight.bold, color: color);
//
// TextStyle headingZero(Size size, Color color) => GoogleFonts.ubuntu(
//     fontSize: size.height * 0.045, fontWeight: FontWeight.bold, color: color);
//
// TextStyle headingOne(Size size, Color color) => GoogleFonts.ubuntu(
//     fontSize: size.height * 0.032, fontWeight: FontWeight.bold, color: color);
//
// TextStyle headingTwo(Size size, Color color) => GoogleFonts.ubuntu(
//     fontSize: size.height * 0.022, fontWeight: FontWeight.bold, color: color);
//
// TextStyle headingTwoNotBold(Size size, Color color) => GoogleFonts.ubuntu(
//     fontSize: size.height * 0.022, fontWeight: FontWeight.normal, color: color);
//
// TextStyle headingThree(Size size, Color color) =>
//     GoogleFonts.ubuntu(fontSize: size.height * 0.018, color: color);
//
// TextStyle kLoginSubtitleStyle(Size size, Color color) =>
//     GoogleFonts.ubuntu(fontSize: size.height * 0.030, color: color);
//
// TextStyle kLoginTermsAndPrivacyStyle(Size size, Color color) =>
//     GoogleFonts.ubuntu(fontSize: 15, color: color, height: 1.5);
//
// TextStyle kHaveAnAccountStyle(Size size, Color color) =>
//     GoogleFonts.ubuntu(fontSize: size.height * 0.022, color: color);
//
// TextStyle kLoginOrSignUpTextStyle(
//   Size size,
// ) =>
//     GoogleFonts.ubuntu(
//       fontSize: size.height * 0.022,
//       fontWeight: FontWeight.w500,
//       color: Colors.deepPurpleAccent,
//     );
//
// TextStyle kTextFormFieldStyle(Color color) => TextStyle(color: color);


List<String> sixName = ["","","","","",""];
List<String> sixDescription = ["","","","","",""];
List<Color> sixColors = [Colors.indigo,Colors.indigo,Colors.indigo,Colors.indigo,Colors.indigo,Colors.indigo];

void updateForSmartContractSign(int winningGerms, UserResponse? userResponse){

  int check = DateTime.now().millisecondsSinceEpoch;
  userResponse?.customerData?.smartContractTime = check.toString();

  int tsr = int.parse(userResponse?.customerData?.totalSignedContract ?? "0");
  tsr = tsr+1;
  userResponse?.customerData?.totalSignedContract = tsr.toString();

  int tgefs = int.parse(userResponse?.customerData?.totalGainsEarnFromContract ?? "0");
  tgefs = tgefs + winningGerms;
  userResponse?.customerData?.totalGainsEarnFromContract = tgefs.toString();

  int tg = int.parse(userResponse?.customerData?.totalGains ?? "0");
  tg = tg + winningGerms;
  userResponse?.customerData?.totalGains = tg.toString();

  int ag = int.parse(userResponse?.customerData?.availableGains ?? "0");
  ag = ag + winningGerms;
  userResponse?.customerData?.availableGains = ag.toString();

  int ulp = int.parse(userResponse?.customerData?.userLevelPoints ?? "1");
  if(ulp >= 98){
    int la = int.parse(userResponse?.customerData?.levelAward ?? "0");

    int tg = int.parse(userResponse?.customerData?.totalGains ?? "0");
    tg = tg + la;
    userResponse?.customerData?.totalGains = tg.toString();

    int ag = int.parse(userResponse?.customerData?.availableGains ?? "0");
    ag = ag + la;
    userResponse?.customerData?.availableGains = ag.toString();
    if(ulp == 98)
      userResponse?.customerData?.userLevelPoints = "1";
    else if (ulp == 99)
      userResponse?.customerData?.userLevelPoints = "2";
    int ul = int.parse(userResponse?.customerData?.userLevel ?? "1");
    ul = ul+1;
    userResponse?.customerData?.userLevel = ul.toString();
  }else{
    ulp = ulp + 2;
    userResponse?.customerData?.userLevelPoints = ulp.toString();
  }

  setUserDetail(userResponse!);

  String stringResponse = jsonEncode(userResponse!);
  setCDToSF(stringResponse);
}

void updateForRoll(int winningGerms, UserResponse? userResponse){

  int check = DateTime.now().millisecondsSinceEpoch;
  userResponse?.customerData?.rollTime = check.toString();

  int tsr = int.parse(userResponse?.customerData?.totalSpinRolled ?? "0");
  tsr = tsr+1;
  userResponse?.customerData?.totalSpinRolled = tsr.toString();

  int tgefs = int.parse(userResponse?.customerData?.totalGainsEarnFromSpin ?? "0");
  tgefs = tgefs + winningGerms;
  userResponse?.customerData?.totalGainsEarnFromSpin = tgefs.toString();

  int tg = int.parse(userResponse?.customerData?.totalGains ?? "0");
  tg = tg + winningGerms;
  userResponse?.customerData?.totalGains = tg.toString();

  int ag = int.parse(userResponse?.customerData?.availableGains ?? "0");
  ag = ag + winningGerms;
  userResponse?.customerData?.availableGains = ag.toString();

  int ulp = int.parse(userResponse?.customerData?.userLevelPoints ?? "1");
  if(ulp == 99){
    int la = int.parse(userResponse?.customerData?.levelAward ?? "0");

    int tg = int.parse(userResponse?.customerData?.totalGains ?? "0");
    tg = tg + la;
    userResponse?.customerData?.totalGains = tg.toString();

    int ag = int.parse(userResponse?.customerData?.availableGains ?? "0");
    ag = ag + la;
    userResponse?.customerData?.availableGains = ag.toString();

    userResponse?.customerData?.userLevelPoints = "1";
    int ul = int.parse(userResponse?.customerData?.userLevel ?? "1");
    ul = ul+1;
    userResponse?.customerData?.userLevel = ul.toString();
  }else{
    ulp = ulp + 1;
    userResponse?.customerData?.userLevelPoints = ulp.toString();
  }

  setUserDetail(userResponse!);

  String stringResponse = jsonEncode(userResponse!);
  setCDToSF(stringResponse);
}

Future updateForLastOnline(UserResponse? userResponse) async{

  int ulp = int.parse(userResponse?.customerData?.userLevelPoints ?? "1");
  if(ulp == 99){
    int la = int.parse(userResponse?.customerData?.levelAward ?? "0");

    int tg = int.parse(userResponse?.customerData?.totalGains ?? "0");
    tg = tg + la;
    userResponse?.customerData?.totalGains = tg.toString();

    int ag = int.parse(userResponse?.customerData?.availableGains ?? "0");
    ag = ag + la;
    userResponse?.customerData?.availableGains = ag.toString();

    userResponse?.customerData?.userLevelPoints = "1";
    int ul = int.parse(userResponse?.customerData?.userLevel ?? "1");
    ul = ul+1;
    userResponse?.customerData?.userLevel = ul.toString();
  }else{
    ulp = ulp + 1;
    userResponse?.customerData?.userLevelPoints = ulp.toString();
  }

  String check = DateTime.now().toString();

  userResponse?.customerData?.lastOnline = check;

  setUserDetail(userResponse!);

  String stringResponse = jsonEncode(userResponse!);
  setCDToSF(stringResponse);
}


String getProfileShortName(String? name) {
  String finalName = "";
  if (name != null && name.isNotEmpty && name != " " && name != "") {
    var nameArray = name.split(" ");
    try {
      if (nameArray.isNotEmpty) {
        if (nameArray.length > 2) {
          finalName = nameArray[0].toString().substring(0, 1);
          finalName = finalName + "" + nameArray[2].toString().substring(0, 1);
        } else if (nameArray.length > 1) {
          finalName = nameArray[0].toString().substring(0, 1);
          finalName = finalName + "" + nameArray[1].toString().substring(0, 1);
        } else {
          finalName = nameArray[0].toString().substring(0, 1);
          finalName = finalName + "" + nameArray[0].toString().substring(1, 1);
        }
      }
    } catch (e) {
      finalName = (nameArray[0].toString().isNotEmpty)
          ? nameArray[0].toString().substring(0, 1)
          : "";
      finalName = finalName +
          "" +
          ((nameArray[0].toString().isNotEmpty)
              ? nameArray[0].toString().substring(1, 1)
              : "");
    }
  } else {
    finalName = "";
  }
  return (finalName.isNotEmpty) ? finalName.toUpperCase() : finalName;
}