// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../../Models/commonmodel.dart';
// import '../size_config.dart';
// import '../style.dart';
// import '../theme.dart';
// import '../typography.dart';
//
//
//
// class ListItemsQIBDialog extends StatelessWidget {
//   final String? title;
//   final Widget? titleWidget;
//   final String? icon;
//   final bool? hideClose;
//   final String? description;
//   final onClose;
//   final CrossAxisAlignment? alignment;
//   final DIALOG_TYPE_EMAIL? type;
//   final List<Widget>? children;
//   final List<String>? contentList;
//   final List<String>? imagePaths;
//   final String? shortMessage;
//
//   const ListItemsQIBDialog(
//       {this.title,
//         this.onClose,
//         this.hideClose,
//         this.description,
//         this.alignment,
//         this.icon,
//         this.titleWidget,
//         this.type,
//         this.children, this.contentList, this.shortMessage, this.imagePaths});
//
//   @override
//   Widget build(BuildContext context) {
//     Color headerColor = (type != null && type == DIALOG_TYPE_EMAIL.ERROR)
//         ? GainGermsTheme().getTheme().color29
//         : GainGermsTheme().getTheme().purpleHeadingColor;
//
//     return WillPopScope(
//       onWillPop: () async {
//         if (Navigator.of(context).userGestureInProgress) {
//           return false;
//         } else {
//           return true;
//         }
//       },
//       child: Scaffold(
//         // backgroundColor: QIBTheme().getTheme().color7.withOpacity(0.8),
//
//         backgroundColor: GainGermsTheme().getTheme().transparent,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Container(
//               decoration:
//               Style().containerTopBorderRadius(GainGermsTheme().getTheme().white, 15, true),
//               padding: EdgeInsets.only(
//                 left: responsiveWidth(5),
//                 right: responsiveWidth(5),
//                 top: responsiveWidth(20),
//                 bottom: responsiveWidth(34),
//               ),
//               child: Column(
//                 crossAxisAlignment:
//                 alignment != null ? alignment! : CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       (hideClose != null && hideClose!)
//                           ? Container()
//                           : Container(
//                         margin: EdgeInsets.only(
//                             left: responsiveWidth(15),
//                             right: responsiveWidth(15),
//                             top: responsiveWidth(10)),
//                         width: responsiveHeight(19),
//                         alignment: Alignment.center,
//                         child: SizedBox(
//                           width: responsiveWidth(20),
//                         ),
//                       ),
//                       title != null
//                           ? Flexible(
//                         child: Container(
//                           margin: EdgeInsets.only(
//                               top: responsiveWidth(
//                                   (hideClose != null && hideClose!)
//                                       ? 10
//                                       : 0)),
//                           child: Text(
//                             title!,
//                             textAlign: TextAlign.center,
//                             style: GainGermsText(
//                                 typo: Typo.H3,
//                                 isBold: true,
//                                 color: headerColor)
//                                 .style(),
//                           ),
//                         ),
//                       )
//                           : titleWidget != null
//                           ? titleWidget!
//                           : Container(),
//                       // (hideClose != null && hideClose == true)
//                       //     ? Container()
//                       //     : QIBRippleButton(
//                       //   iconWidget: SizedBox(
//                       //     height: responsiveWidth(20),
//                       //     width: responsiveWidth(20),
//                       //     child: SvgPicture.asset(
//                       //       QIBImage().getImage().close,
//                       //       color:GainGermsTheme().getTheme().color6,
//                       //     ),
//                       //   ),
//                       //   padding: EdgeInsets.all(
//                       //     responsiveWidth(15),
//                       //   ),
//                       //   onTap: () {
//                       //     if (onClose == null) {
//                       //       Navigator.pop(context);
//                       //     } else {
//                       //       onClose();
//                       //     }
//                       //   },
//                       // )
//                     ],
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(
//                       left: responsiveWidth(15),
//                       right: responsiveWidth(15),
//                     ),
//                     child: ConstrainedBox(
//                         constraints: BoxConstraints(
//                             maxHeight: screenHeight! - responsiveHeight(150)),
//                         child: SingleChildScrollView(
//                           scrollDirection: Axis.vertical,
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 height: responsiveHeight(15),
//                               ),
//                               (icon != null && icon != "")
//                                   ? Column(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                       padding: EdgeInsets.only(
//                                           bottom: responsiveWidth(10)),
//                                       child: SizedBox(
//                                         child:
//                                         icon!.contains('.svg') == true
//                                             ? SvgPicture.asset(
//                                           icon!,
//                                           fit: BoxFit.cover,
//                                           // color:QIBTheme().getTheme().color6,
//                                         )
//                                             : Image.asset(icon!,
//                                             fit: BoxFit.cover),
//                                       )),
//                                   SizedBox(
//                                     height: responsiveHeight(
//                                         icon != null && icon != ""
//                                             ? 10
//                                             : 0),
//                                   ),
//                                 ],
//                               )
//                                   : Container(
//                                 height: responsiveHeight(0),
//                               ),
//                               description == null
//                                   ? Container()
//                                   : Text(
//                                 description!,
//                                 textAlign: TextAlign.center,
//                                 style: GainGermsText(typo: Typo.H4).style(),
//                               ),
//                               SizedBox(
//                                 height: responsiveHeight(31),
//                               ),
//                               shortMessage == null
//                                   ? Container()
//                                   : Text(
//                                 shortMessage!,
//                                 textAlign: TextAlign.center,
//                                 style: GainGermsText(typo: Typo.H4,color: Colors.blue,isBold: true).style(),
//                               ),
//                               shortMessage == null
//                                   ? Container()
//                                   : SizedBox(
//                                 height: responsiveHeight(28),
//                               ),
//                               ListView.separated(
//                                 physics: NeverScrollableScrollPhysics(),
//                                   padding: EdgeInsets.only(left:50,right: 50),
//                                   shrinkWrap: true,
//                                   separatorBuilder: (context, index) => SizedBox(
//                                     height: responsiveHeight(5),
//                                   ),
//                                   itemCount: contentList!.length,
//                                   itemBuilder: (context, index) => Padding(
//                                     padding: EdgeInsets.all(0.0),
//                                     child:
//                                     ListTile(
//                                       visualDensity: VisualDensity(horizontal: 0, vertical: -4),
//                                       leading: imagePaths==null?Icon(Icons.check,color: Colors.blue,size: 12,):
//                                           SvgPicture.asset(
//                                             '${imagePaths![index]}',
//                                             color:GainGermsTheme().getTheme().color6,
//                                           ),
//                                       title:  Text('${contentList![index]}',
//                                               style: GainGermsText(
//                                                   typo: Typo.H5,  color: GainGermsTheme().isDarkMode()?GainGermsTheme().getTheme().white:GainGermsTheme().getTheme().headerColor)
//                                                   .style(),
//                                             ),
//                                     )
//                                     // Row(
//                                     //   children: [
//                                     //     SizedBox(
//                                     //       width: responsiveWidth(6),
//                                     //     ),
//                                     //     imagePaths==null?Icon(Icons.check,color: Colors.blue,size: 12,):
//                                     //     SvgPicture.asset(
//                                     //       '${imagePaths![index]}',
//                                     //       color:QIBTheme().getTheme().color6,
//                                     //     ),
//                                     //     SizedBox(
//                                     //       width: responsiveWidth(17),
//                                     //     ),
//                                     //     Text('${contentList![index]}',
//                                     //       style: QIBText(
//                                     //           typo: Typo.H5,  color: QIBTheme().isDarkMode()?QIBTheme().getTheme().white:QIBTheme().getTheme().headerColor)
//                                     //           .style(),
//                                     //     ),
//                                     //
//                                     //   ],),
//
//                                   )),
//                               SizedBox(
//                                 height: responsiveHeight(60),
//                               ),
//                               children != null
//                                   ? Column(
//                                 crossAxisAlignment: alignment != null
//                                     ? alignment!
//                                     : CrossAxisAlignment.start,
//                                 children: children!,
//                               )
//                                   : Container(),
//                             ],
//                           ),
//                         )),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
