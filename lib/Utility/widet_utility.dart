import 'package:flutter/material.dart';


// enum Feature_management { Data, cards, theGroup }
//
// extension on Feature_management{
//   String? get value {
//     switch (this) {
//       case Data.absher:
//         return 'VISA_PLATINUM';
//       case Data.MASTERCARD:
//         return 'MASTERCARD';
//       case Data.VISA_PREPAID_CARD:
//         return 'VISA_PREPAID_CARD';
//       default:
//         return null;
//     }
//   }
// }
class WidgetUtility {
  BuildContext? errorPopupContext;

  static WidgetUtility? utility;

  static WidgetUtility? getInstance() {
    utility ??= WidgetUtility();
    return utility;
  }

  // getRowWidget(String text1, String? text2, [String? text3]) {
  //      return QIBRowFieldValue(field: text1, value1: text2, value2: text3);
  //
  // }

}
