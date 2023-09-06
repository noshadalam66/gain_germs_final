import 'package:flutter/material.dart';

import '../Theme/theme.dart';

class ColorUility {
  Color smallButtonTextColor() {
    return GainGermsTheme().getTheme().color5;
  }
  Color disableButtonTextColor(){
    return GainGermsTheme().getTheme().color16;
  }
  Color disableGreyColor(){
    return GainGermsTheme().getTheme().color8;
  }
  Color errorRedColor(){
    return GainGermsTheme().getTheme().color10;
  }
  Color focusedBlueColor(){
    return GainGermsTheme().getTheme().color6;
  }
  Color enableGreyColor(){
    return GainGermsTheme().getTheme().color3;
  }
  Color weak(){
    return GainGermsTheme().getTheme().color_46;
  }
  Color moderate(){
    return GainGermsTheme().getTheme().color4;
  }
  Color good(){
    return GainGermsTheme().getTheme().color1;
  }
  Color strong(){
    return GainGermsTheme().getTheme().color11;
  }
}