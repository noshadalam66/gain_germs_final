
import '../Theme/style.dart';

class GainGermsTheme {
  static Style _style = Style();

  static const String RETAIL_MASS = "retail-global-theme";
  static const String TAMAYUZ = "tamayuz-theme";
  static const String PRIVATE = "private-theme";

  Style getTheme() {
    //
    // if (getCustomerInfo() != null) {
    //   String categoryTheme=TAMAYUZ;//Utility.themeCategory;
    //   if (!isSegmentMode()) {
    //     categoryTheme = RETAIL_MASS;
    //   }
    //   categoryTheme = TAMAYUZ;
    //
    //   switch (categoryTheme) {
    //     case RETAIL_MASS:
    //       return isDarkMode() ? _darkStyleTamayuz : _style;
    //       // return isDarkMode() ? _darkStyle : _style;
    //     case TAMAYUZ:
    //       return isDarkMode() ? _darkStyleTamayuz : _styleTamayuz;
    //     case PRIVATE:
    //       return isDarkMode() ? _darkStylePrivate : _stylePrivate;
    //     default:
    //       return isDarkMode() ? _darkStyleTamayuz : _style;
    //       // return isDarkMode() ? _darkStyle : _style;
    //   }
    // } else {
      return  _style;
    // }
  }

  bool isDarkMode() {
    return false;
    // bool? isDarkMode=Utility.isDarkMode;
    // return isDarkMode;
  }

  bool isSegmentMode() {
    return false;
    // bool? isSegment = Utility.isSegmentMode;
    // return isSegment;
  }
}
