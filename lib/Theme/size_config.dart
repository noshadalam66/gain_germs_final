import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static double? screenHeight;
  static double? screenWidth;
  static double? defaultHeight;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    orientation = _mediaQueryData.orientation;
  }
}

double? screenHeight = SizeConfig.screenHeight;
double? screenWidth = SizeConfig.screenWidth;

double responsiveHeight(double height) {
  double screenHeight = SizeConfig.screenHeight!;
  return (height / 896.0) * screenHeight;
}

double responsiveWidth(double width) {
  double screenWidth = SizeConfig.screenWidth!;
  return (width / 414.0) * screenWidth;
}
