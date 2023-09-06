// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../size_config.dart';
// import '../theme.dart';
// import '../typography.dart';
//
// showConfimationPopupSingleButton(
//     String title,
//     BuildContext context,
//     String iconUrl,
//     String message,
//     String button1,
//     Function onClick1,
//     ) {
//   showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       barrierColor: Color.fromRGBO(0, 0, 0, 0.7),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//             topRight: Radius.circular(responsiveWidth(20.0)),
//             topLeft: Radius.circular(responsiveWidth(20.0))),
//       ),
//       backgroundColor: GainGermsTheme().getTheme().white,
//       builder: (BuildContext context) {
//         return Container(
//             margin: EdgeInsets.symmetric(horizontal: responsiveWidth(20.0)),
//             height: responsiveHeight(300),
//             decoration: BoxDecoration(
//               color: GainGermsTheme().getTheme().white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(responsiveWidth(20.0)),
//                 topRight: Radius.circular(responsiveWidth(20.0)),
//               ),
//             ),
//             child: Column(
//               children: [
//                 Container(
//                   margin: EdgeInsets.only(top: responsiveWidth(30.0)),
//                   width: double.infinity,
//                   child: Row(
//                     children: [
//                       Expanded(
//                           child: Text(
//                             title,
//                             style: GainGermsText(
//                               isBold: true,
//                               typo: Typo.H3,
//                               color: GainGermsTheme().getTheme().purpleHeadingColor,
//                             ).style(),
//                             textAlign: TextAlign.center,
//                           )),
//                       // Container(
//                       //     height: responsiveHeight(30),
//                       //     alignment: Alignment.center,
//                       //     child: QIBIconButton(
//                       //         onTap: () {
//                       //           Navigator.pop(context);
//                       //         },
//                       //         icon: QIBImage().getImage().close,
//                       //         color: GainGermsTheme().getTheme().color6
//                       //     ))
//                     ],
//                   ),
//                 ),
//                 // SizedBox(height: responsiveHeight(50)),
//                 iconUrl.isEmpty
//                     ? Container()
//                     : Container(
//                   width: responsiveWidth(80),
//                   height: responsiveWidth(80),
//                   alignment: Alignment.center,
//                   child: SvgPicture.asset(iconUrl),
//                 ),
//                 // SizedBox(height: responsiveHeight(28)),
//                 Text(
//                   message,
//                   style: GainGermsText(
//                     typo: Typo.H6,
//                   ).style(),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: responsiveHeight(60.0)),
//                 // QIBButtonWithIcon(
//                 //   text: button1,
//                 //   // backgroundColor: QIBTheme().getTheme().white,
//                 //   // color: QIBTheme().getTheme().color6,
//                 //   // borderColor: QIBTheme().getTheme().color6,
//                 //   onTap: onClick1,
//                 // ),
//               ],
//             ));
//       });
// }
