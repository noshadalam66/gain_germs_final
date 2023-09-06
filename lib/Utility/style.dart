import 'package:flutter/material.dart';

import '../Models/commonmodel.dart';
import '../Theme/hex_color.dart';
import '../Theme/size_config.dart';
import '../Theme/theme.dart';
import 'color_utility.dart';
class Style {
  static double progressLoaderBackgroundOpacity = 0.95;
  static Color progressLoaderBackgroundColor = HexColor("#2D5164");

  String getBoldFont() {
    var language = getUserCurrentLanguageInMemory();
    if (language == "en_US" ||
        language == null ||
        language.toString().isEmpty) {
      return "OpenSans-SemiBold";
    } else {
      return "Almarai-Bold";
    }
  }

  String getLanguageFont() {
    var language = getUserCurrentLanguageInMemory();
    if (language == "en_US" ||
        language == null ||
        language.toString().isEmpty) {
      return "Almarai-Bold";
    } else {
      return "OpenSans-SemiBold";
    }
  }

  String getRegularFont() {
    var language = getUserCurrentLanguageInMemory();
    if (language == "en_US" ||
        language == null ||
        language.toString().isEmpty) {
      return "OpenSans-Regular";
    } else {
      return "Almarai-Regular";
    }
  }

  Alignment getCenterAlignement() {
    var language = getUserCurrentLanguageInMemory();
    if (language == "en_US" ||
        language == null ||
        language.toString().isEmpty) {
      return Alignment.centerLeft;
    } else {
      return Alignment.centerRight;
    }
  }

  // Text Field Style
  TextStyle errorTextFieldStyle() {
    return TextStyle(
        fontFamily: Style().getBoldFont(),
        fontSize: 12,
        color: ColorUility().errorRedColor());
  }

  OutlineInputBorder enableOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide:
          BorderSide(color: ColorUility().enableGreyColor(), width: 1.0),
      borderRadius: const BorderRadius.all(
        Radius.circular(15.0),
      ),
    );
  }

  OutlineInputBorder focusedOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide:
          BorderSide(color: ColorUility().focusedBlueColor(), width: 1.0),
      borderRadius: const BorderRadius.all(
        Radius.circular(15.0),
      ),
    );
  }

  OutlineInputBorder errorOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: ColorUility().errorRedColor(), width: 1.0),
      borderRadius: const BorderRadius.all(
        Radius.circular(15.0),
      ),
    );
  }

  OutlineInputBorder searchDisableOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide:
          BorderSide(color: ColorUility().disableGreyColor(), width: 1.0),
      borderRadius: const BorderRadius.all(
        Radius.circular(15.0),
      ),
    );
  }

  BoxShadow customerCardShadowEffect() {
    return BoxShadow(
      color: GainGermsTheme().getTheme().black.withOpacity(.08),
      blurRadius: 6.0, // soften the shadow
      spreadRadius: 2.0, //extend the shadow
      offset: Offset(
        0.0,
        2.0,
      ),
    );
  }

  BoxShadow customerButtonCardShadowEffect() {
    return BoxShadow(
      color: GainGermsTheme().getTheme().black.withOpacity(.08),
      blurRadius: 6.0, // soften the shadow
      spreadRadius: 0.0, //extend the shadow
      offset: Offset(
        0.0,
        1.0,
      ),
    );
  }

  BoxDecoration containerButtonDecoration(Color backgroundColor) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      boxShadow: [Style().customerButtonCardShadowEffect()],
    );
  }

  BoxDecoration containerCardDecoration(Color backgroundColor) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      boxShadow: [Style().customerCardShadowEffect()],
    );
  }

  BoxDecoration containerCardDecorationWithOutShadow(Color backgroundColor) {
    return BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        border: Border.all(color: GainGermsTheme().getTheme().color3, width: 1.0));
  }

  BoxDecoration containerCardDecorationWithOutShadowNStorke(
      Color backgroundColor) {
    return BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(20.0)));
    // border: Border.all(color: QIBTheme().getTheme().color3, width: 1.0));
  }

  BoxDecoration containerCardDecorationWithOutShadowRadius(
      Color backgroundColor, double radius) {
    return BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        border: Border.all(color: GainGermsTheme().getTheme().color3, width: 1.0));
  }

  BoxDecoration containerCardDecorationWithBorder(
      Color backgroundColor, Color borderColor) {
    return BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: borderColor, width: 1.0));
  }

  BoxDecoration containerCardDecorationTransparent() {
    return BoxDecoration(
        color: GainGermsTheme().getTheme().transparent,
        borderRadius: BorderRadius.all(Radius.circular(0)),
        border: Border.all(color: GainGermsTheme().getTheme().transparent, width: 0.0));
  }

  BoxDecoration containerBottomBorderRadius(
      Color backgroundColor, double radius, bool showShadow) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius)),
      boxShadow: showShadow ? [Style().customerCardShadowEffect()] : [],
    );
  }

  BoxDecoration selectDecorationWithBorder(
      Color backgroundColor, Color borderColor) {
    return BoxDecoration(
        color: GainGermsTheme().isDarkMode()?GainGermsTheme().getTheme().cardcolor:backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(responsiveWidth(15))),
        border: Border.all(color: GainGermsTheme().isDarkMode()?GainGermsTheme().getTheme().color3:borderColor, width: 1.0));
  }

  BoxDecoration containerTopBorderRadius(
      Color backgroundColor, double radius, bool showShadow) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius), topRight: Radius.circular(radius)),
      boxShadow: showShadow ? [Style().customerCardShadowEffect()] : [],
    );
  }

  BoxDecoration containerCardDecorationWithShadow(Color backgroundColor) {
    return BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(width: 1.0, color: GainGermsTheme().getTheme().color3));
  }

  BoxDecoration containerTopBorderRadiusWithOutShadow(Color backgroundColor) {
    return BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20)),
        border: Border.all(width: 1.0, color: GainGermsTheme().getTheme().color3));
  }
}
