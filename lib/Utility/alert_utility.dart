import 'package:flutter/material.dart';


import '../Theme/size_config.dart';
import '../Theme/theme.dart';
import '../Theme/typography.dart';



class AlertUtility {
  showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor:
          GainGermsTheme().isDarkMode() ? Colors.black : GainGermsTheme().getTheme().color6,
      content: Text(message),
    ));
  }

  Future<void> showAlertDialog(context, title, message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showDismissibleAlertDialog(BuildContext context, String title,
      String description, Color titleColor, Color descriptionColor) async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        barrierColor: GainGermsTheme().getTheme().color7.withOpacity(0.8),
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(responsiveWidth(8))),
            ),
            backgroundColor: GainGermsTheme().isDarkMode()
                ? GainGermsTheme().getTheme().color1
                : GainGermsTheme().getTheme().white,
            content: Container(
              width: double.infinity,
              height: responsiveHeight(190.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    type: MaterialType.transparency,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: GainGermsText(
                              typo: Typo.H4, color: titleColor, isBold: true)
                          .style(),
                    ),
                  ),
                  SizedBox(height: responsiveHeight(7.0)),
                  Material(
                    type: MaterialType.transparency,
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: GainGermsText(
                              typo: Typo.H4,
                              color: descriptionColor,
                              isBold: true)
                          .style(),
                    ),
                  ),
                  SizedBox(height: responsiveHeight(12.0)),
                  Image.asset('assets/images/ic_success.png',
                      width: 50, height: 50),
                ],
              ),
            ),
          );
        });
  }
}
