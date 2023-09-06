// import 'package:flutter/material.dart';
//
// import '../size_config.dart';
// import '../style.dart';
// import '../theme.dart';
// import '../typography.dart';
//
// /// Add to Apple wallet button for ICC Confirmation Screen
// class AddToAppleButton extends StatelessWidget {
//   final String? text;
//   final String? prefixIcon;
//   final String? sufixIcon;
//   final onTap;
//   final Color? color;
//   final bool? disabled;
//   final Color? backgroundColor;
//   final Color? borderColor;
//   final Color? textColor;
//   final double? circularRadius;
//
//   const AddToAppleButton(
//       {this.text,
//       this.color,
//       this.backgroundColor,
//       this.prefixIcon,
//       this.sufixIcon,
//       this.disabled,
//       this.borderColor,
//       this.onTap,
//       this.textColor,
//       this.circularRadius});
//
//   @override
//   Widget build(BuildContext context) {
//     var background = (disabled != null) && disabled!
//         ? GainGermsTheme().getTheme().color8 // button disable color
//         : (backgroundColor ??
//             GainGermsTheme().getTheme().color6); // button enable color
//
//     if (GainGermsTheme().isDarkMode()) {
//       background = (disabled != null) && disabled!
//           ? GainGermsTheme()
//               .getTheme()
//               .buttondisablecolordak
//               .withOpacity(0.5) // button disable color
//           : (backgroundColor ??
//               GainGermsTheme().getTheme().color1); // button enable color
//
//     }
//
//     var isDisabled = disabled ?? false;
//     var foreground = (disabled != null) && disabled!
//         ? GainGermsTheme().getTheme().color16
//         : (color ?? GainGermsTheme().getTheme().white);
//
//     return Container(
//       child: Material(
//         child: InkWell(
//             customBorder: RoundedRectangleBorder(
//               borderRadius:
//                   BorderRadius.circular(responsiveWidth(circularRadius ?? 20)),
//             ),
//             onTap: () {
//               if (!isDisabled) {
//                 // Future.delayed(Duration(milliseconds: 150), () {
//                 onTap();
//                 //  });
//               }
//             },
//             child: Container(
//               height: responsiveHeight(60),
//               alignment: Alignment.center,
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     prefixIcon != null
//                         ? Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: responsiveWidth(10)),
//                             child: Image.asset(prefixIcon!,
//                                 //color: foreground,
//                                 width: responsiveWidth(40),
//                                 height: responsiveWidth(40)),
//                           )
//                         : Container(),
//                     SizedBox(
//                       height: 10,
//                       width: 5,
//                     ),
//                     Text(
//                       text!,
//                       style: GainGermsText(
//                               typo: Typo.H5,
//                               isBold: false,
//                               color: textColor == null
//                                   ? GainGermsTheme().isDarkMode()
//                                       ? GainGermsTheme().getTheme().grey
//                                       : foreground
//                                   : textColor)
//                           .style(),
//                       textAlign: TextAlign.center,
//                     ),
//                     sufixIcon != null
//                         ? Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: responsiveWidth(10)),
//                             child: Image.asset(sufixIcon!,
//                                 width: responsiveWidth(25),
//                                 //color: foreground,
//                                 height: responsiveWidth(25)),
//                           )
//                         : Container(),
//                   ]),
//             )),
//         color: GainGermsTheme().getTheme().transparent,
//       ),
//       decoration: qibButtonDecoration(
//           background, borderColor ?? background, isDisabled, false,
//           radius: circularRadius),
//     );
//   }
//
//   BoxDecoration qibButtonDecoration(Color? backgroundColor, Color? borderColor,
//       bool? isDisabled, bool? removeOutline,
//       {double? radius}) {
//     if (removeOutline != null && removeOutline) {
//       return BoxDecoration(
//         color: backgroundColor,
//         border: Border.all(
//             color: GainGermsTheme().isDarkMode()
//                 ? Colors.transparent
//                 : borderColor ?? Colors.transparent),
//         borderRadius: BorderRadius.all(Radius.circular(responsiveWidth(20))),
//         boxShadow: isDisabled != null && isDisabled == true
//             ? null
//             : GainGermsTheme().isDarkMode()
//                 ? [Style().customerButtonCardShadowEffectDark()]
//                 : [Style().customerButtonCardShadowEffect()],
//       );
//     }
//
//     return BoxDecoration(
//       color: backgroundColor,
//       border: Border.all(
//           color: GainGermsTheme().isDarkMode()
//               ? GainGermsTheme().getTheme().color1
//               : borderColor ?? Colors.transparent),
//       borderRadius:
//           BorderRadius.all(Radius.circular(responsiveWidth(radius ?? 20))),
//       boxShadow: isDisabled != null && isDisabled == true
//           ? null
//           : GainGermsTheme().isDarkMode()
//               ? [Style().customerButtonCardShadowEffectDark()]
//               : [Style().customerButtonCardShadowEffect()],
//     );
//   }
// }
