import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../Models/user_details.dart';


addStringToSF(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

//Return String
getStringValuesSF(String key) async {
  SharedPreferences prefs =
      await SharedPreferences.getInstance();
  String stringValue = prefs.getString(key) ?? "";
  return stringValue;
}

addIntToSF(String key, int value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}


//Return int
getIntValuesSF(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int intValue = prefs.getInt(key) ?? 0;
  return intValue;
}


addDoubleToSF(String key, double value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble(key, value);
}


//Return double
getDoubleValuesSF(String key) async {
  SharedPreferences prefs =
      await SharedPreferences.getInstance();
  double doubleValue = prefs.getDouble(key) ?? 0.0;
  return doubleValue;
}

addBoolToSF(String key, bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}

//Return bool
getBoolValuesSF(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool boolValue = prefs.getBool(key) ?? false;
  return boolValue;
}

removeValues(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}

checkValue(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.containsKey(key);
}


Future<UserResponse?> getCDFromSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String stringValue = prefs.getString("userData") ?? "";
  UserResponse? customerDataObj;
  if(stringValue != "" && stringValue.isNotEmpty){
    Map<String, dynamic> userResponse = json.decode(stringValue);
    // var customerData = userResponse['customerData'];
    customerDataObj = UserResponse.fromJson(userResponse);
  }

  return customerDataObj;
}

setCDToSF(String customerData) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("userData", customerData);
}

