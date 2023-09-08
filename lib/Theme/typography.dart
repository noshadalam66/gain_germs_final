import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gain_germs_final/Theme/theme.dart';

import '../Models/commonmodel.dart';
import '../Utility/style.dart';


class GainGermsText {
  Typo? typo;
  bool? isBold;
  Color? color;
  bool? underline;
  String? fontFamiliy;
  bool? blockZoom;
  FontStyle? fontStyle;
  final fontConfig = {
    Typo.H1: {"id": 'H1', "font": 22, "zoomFont": 24},
    Typo.H2: {"id": 'H2', "font": 20, "zoomFont": 22},
    Typo.H3: {"id": 'H3', "font": 18, "zoomFont": 20},
    Typo.H4: {"id": 'H4', "font": 16, "zoomFont": 18},
    Typo.H5: {"id": 'H5', "font": 14, "zoomFont": 16},
    Typo.H6: {"id": 'H6', "font": 13, "zoomFont": 15},
    Typo.H7: {"id": 'H7', "font": 12, "zoomFont": 14},
    Typo.H8: {"id": 'H8', "font": 11, "zoomFont": 13},
    Typo.H9: {"id": 'H9', "font": 10, "zoomFont": 12},
    Typo.H11: {"id": 'H11', "font": 7, "zoomFont": 8},
    Typo.H0: {"id": 'H0', "font": 28, "zoomFont": 30},
    Typo.H10: {"id": 'H10', "font": 28, "zoomFont": 28},
    Typo.AMOUNT: {"id": 'AMOUNT', "font": 34, "zoomFont": 36},
    Typo.H30: {"id": 'H30', "font": 30, "zoomFont": 32},
    Typo.H26: {"id": 'H26', "font": 26, "zoomFont": 28},
    Typo.H15: {"id": 'H15', "font": 15, "zoomFont": 17},
  };

  GainGermsText(
      {required this.typo,
      this.isBold,
      this.color,
      this.blockZoom,
      this.fontFamiliy,
      this.underline,
      this.fontStyle});
  TextStyle style() {
    int fontInt = fontConfig[typo!]!['font'] as int;
    String fontString = fontInt.toString();
    // final int fontSize = getIsRegularFont()
    //     ? fontConfig[typo!]!['font'] as int
    //     : blockZoom != null && blockZoom!
    //         ? fontConfig[typo!]!['font'] as int
    //         : fontConfig[typo!]!['zoomFont'] as int;
    ////print\(fontSize);
    return TextStyle(
      fontSize: double.parse(fontString),
      fontFamily: fontFamiliy != null
          ? fontFamiliy
          : ((isBold != null) && isBold! ? getBoldFont() : getRegularFont()),
      fontStyle: fontStyle ?? FontStyle.normal,
      // fontSize: ScreenUtil().setSp(
      //   fontSize,
      // ),
      color: (color == null) ? GainGermsTheme().getTheme().headerColor : color,
      decoration: (underline != null) && underline!
          ? TextDecoration.underline
          : TextDecoration.none,
      fontFeatures: [
        FontFeature.enable('sups'),
      ],
    );
  }

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
}

enum Typo { H0, H1, H2, H3, H4, H5, H6, H7, H8, H9, H11, AMOUNT, H10, H30, H26, H15 }

TextStyle qibIbanStyle(int? fontSize, Color? color, bool? isBold) {
  return TextStyle(
      fontSize: ScreenUtil().setSp(
        fontSize ?? 13,
      ),
      fontFamily:
          isBold != null ? Style().getBoldFont() : Style().getRegularFont(),
      color: color ?? GainGermsTheme().getTheme().headerColor);
}

TextStyle regularFont(Color color) {
  return TextStyle(
      fontSize: ScreenUtil().setSp(
        13,
      ),
      fontFamily: Style().getRegularFont(),
      color: color);
}

TextStyle smallBtnStyle() {
  return TextStyle(
      color: GainGermsTheme().getTheme().color5,
      fontSize: ScreenUtil().setSp(
        12,
      ),
      fontFamily: Style().getBoldFont());
}

TextStyle purpleHeaderText() {
  return TextStyle(
    fontFamily: Style().getRegularFont(),
    fontSize: ScreenUtil().setSp(
      18,
    ),
    color: GainGermsTheme().getTheme().purpleHeadingColor,
  );
}

TextStyle productCardName() {
  return TextStyle(
    fontFamily: Style().getRegularFont(),
    fontSize: ScreenUtil().setSp(
      12,
    ),
    color: GainGermsTheme().getTheme().headerColor,
  );
}
