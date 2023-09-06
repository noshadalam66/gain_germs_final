import 'dart:convert';
import 'package:gain_germs_final/Models/user_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

var userLanguage;
bool isRegularFont = true;

int? paymentType;


UserResponse? userResponse;
setUserDetail(UserResponse ur){
  userResponse = ur;
}

UserResponse? getUserDetail(){
  return userResponse;
}

String navigatedFrom = "";
String? usernameValue = "";

// TopUpConfirm? topUpConfirmObj;
String? rsaToken;
String? abhserNationalId;
bool? rewardfromSmartbtn = false;
bool hasMPayAccess = false;
bool hasGroupAccess = false;
bool? isHuawei = false;
// IpoDataModel? ipoData;
var dataId;
bool eipoLandingAddMore = false;
List<String>? profileCity = [];
List? mostUsedAccounts = [];

var offerData = {};
late var soAccountListData;
var paymentAccountData;


///Activation of Dormant Account
bool shouldUpdateAccount = false;
bool shouldUpdateDocs = false;
// MyAccountsModel? _accountInfo;
List<String> qidImageList = [];
List<String> passportImageList = [];
List<String> activatedAccountList = [];

String deviceExceededUserName = "";

setDeviceExceededUserName(dynamic obj) {
  deviceExceededUserName = obj;
}

String getDeviceExceededUserName() {
  return deviceExceededUserName;
}
bool isSwitchToMinor = false;

setIsSwitchToMinor(bool obj) {
  isSwitchToMinor = obj;
}

dynamic getIsSwitchToMinor() {
  return isSwitchToMinor;
}

setPreLoginOffers(dynamic obj) {
}

dynamic getPreLoginOffers() {
  return "";
}

setStaticDataLoaded(bool isData) {
}

bool getStaticDataLoaded() {
  return true;
}

setStaticDataLoadedHome(bool isData) {
}

bool getStaticDataLoadedHome() {
  return true;
}


setCountryName(String? placeM) {
}

getCountryName() {
}

getpaymentAccountData() {
  return paymentAccountData;
}

setPaymentAccountData(val) {
  paymentAccountData = val;
}

setDataId(val) {
  dataId = val;
}

getDataId() {
  return dataId;
}

setCardImages(val) {
}

getCardImages() {

}

bool crsFromLogin = false;
bool crsFatcaPopupShown = false;

bool postRistrictionPopupShown = false;

bool myProductAccFromHome = false;
bool myCardsFromHome = false;
bool fromMyProducts = false;
bool fromMyHomePay = false;
bool fromMyHomeTransfer = false;

bool myProductAccFromNetwoth = false;
bool myProductCardFromNetwoth = false;
bool myProductDepFromNetwoth = false;
bool myProductInvFromNetwoth = false;
bool myProductFinanceFromNetwoth = false;

enum DIALOG_TYPE_EMAIL { ERROR, INFO }

bool isPrimaryPopupClosed = false;

bool isEMIPostPoneFlow = false;
bool openAccountFromMore = false;
bool isOCFExpatsFlow = false;
var daysToVisitBranchForOcfExpat;
bool _vCasCompleted = false;

//login assistance
String loginAssistType = 'DEFAULT';

var retriveUserNameVal;
bool? fromRetriveUserName;


int? lastTouchTimeAfterLogin;

bool? isUserLogin;
bool isShownLogoutPopup = false;

var iOSDeviceToken;
bool skipDone = false;

bool isSPECIAL_DAYS = false;

setIOSDeviceToken(var token) {
  iOSDeviceToken = token;
}

getIOSDeviceToken() {
  if (iOSDeviceToken == null || iOSDeviceToken.toString().isEmpty) {
    iOSDeviceToken = "";
  }
  return iOSDeviceToken;
}

setIsUserLogin(bool value) {
  isUserLogin = value;
}

getIsUserLogin() {
  isUserLogin ??= false;
  return isUserLogin;
}

setShownLogoutPopup(bool value) {
  isShownLogoutPopup = value;
}

getShownLogoutPopup() {
  isShownLogoutPopup;
  return isShownLogoutPopup;
}

setTouchTimeAfterLogin(int touchTime) {
  lastTouchTimeAfterLogin = touchTime;
}

getTouchTimeAfterLogin() {
  lastTouchTimeAfterLogin ??= 0;
  return lastTouchTimeAfterLogin;
}

getMostUsedAccounts() {
  return mostUsedAccounts;
}

setMostUsedAccounts(val) {
  mostUsedAccounts = val;
}

//standing order
String standingOrderTitle = "";
int withinMyAcc = 0;
int local = 1;
int international = 2;
int standingOrderType = 0;

getCustomerInfo() {
  // return custmorInfoData;
}
String? getDeviceId() {
  // return deviceId;
}
getUserProfileData() {
  // return userProfileObj;
}
getUserCurrentLanguageInMemory() {
  if (userLanguage == null || userLanguage.toString().isEmpty) {
    userLanguage = "en_US";
    return "en_US";
  }
  return userLanguage;
}
getIsRegularFont() {
  return isRegularFont;
}
getCardStatus() {
  // return cardStatus;
}
getAppVersionConfig() {
  // return appVersionConfig;
}
setValueToLocal(String key, String? value) async {


}

Future<String> getValueFromLocal(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? value = prefs.getString(key);
  if (value == null || value == "") {
    return "";
  } else {
    // value = await (Encryption().stringDecryption(value)); //as FutureOr<String>);
  }
  return value;
}
Future<List<String>> getListFromLocal(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? value = prefs.getStringList(key);
  if (value == null || value == "") {
    return [];
  } else {
    return value;
  }
}

setValueToLocalN(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (value != "") {
    // value = await (Encryption().stringEncryption(value));
  } else {}
  prefs.setString(key, value);
}
//
setValueToLocalObject(String key, value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (value != "") {
    // value = await (Encryption().stringEncryption(value));
  } else {}
  prefs.setString(key, json.encode(value));
}
getStaffChargePercentageSectorCode(sectCode) {
  sectCode = int.parse(sectCode.toString());
}