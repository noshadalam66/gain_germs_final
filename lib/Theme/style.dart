import 'package:flutter/material.dart';
import 'package:gain_germs_final/Theme/size_config.dart';
import 'package:gain_germs_final/Theme/theme.dart';
import 'package:gain_germs_final/Theme/typography.dart';
import '../Models/commonmodel.dart';
import '../Utility/color_utility.dart';
import 'hex_color.dart';

class Style {
   final double progressLoaderBackgroundOpacity = 0.95;
   final double progressLoaderBackgroundOpacityLight = 0.5;

   final Color backGroundColor = HexColor("#171C30");
   final Color layoutColor = HexColor("#262D47");
   final Color textViewColor = HexColor("#EFF0F5");
   final Color buttonColor = HexColor("#2699FB");



   final Color progressLoaderBackgroundColor = HexColor("#2D5164");//background while loading
   final Color profileBorderColor = HexColor("#1275B0");
   final Color headerColor = HexColor("#444344");//text style
   final Color purpleHeadingColor = HexColor("#6F2A7F");
   final Color color1 = HexColor("#00A1DE");
   final Color color2 = HexColor("#EDEDED");
   final Color color3 = HexColor("#E8E8E8");
   final Color color4 = HexColor("#E17F25");//iban color
   final Color color5 = HexColor("#1B9DDB");//small text color
   final Color color6 = HexColor("#0075B0");//main color
   final Color colorCert = HexColor("#0075B0");
   final Color color7 = HexColor("#002E45");
   final Color color9 = HexColor("#D9D9D9");
   final Color color8 = HexColor("#F4F4F4");
   final Color color10 = HexColor("#FA2121");
   final Color color11 = HexColor("#2BC431");
   final Color color12 = HexColor("#63A70A");
   final Color color13 = HexColor("#19ACE4");
   final Color color14 = HexColor("#E20909");
   final Color color15 = HexColor("#2E2E2E");
   final Color color16 = HexColor("#868686");
   final Color color17 = HexColor("#D9EAF3");
   final Color color18 = HexColor("#FFFFFF");//white
   final Color color19 = HexColor('#EA0000');
   final Color color20 = HexColor("#DFF6E0");
   final Color color21 = HexColor('#2ec534');
   final Color color27 = HexColor('#CECECE');
   final Color black = HexColor('#000000');
   final Color unselectedcolor = HexColor('#979797');
   final Color color22 = HexColor('#D4D7DD');
   final Color color23 = HexColor('#FFDEDE');
   final Color color24 = HexColor('#B3B3B3');
   final Color color25 = HexColor('#FEC7C7');
   final Color inactiveSlider = HexColor("#CECECE");
   final Color milkBlue = HexColor("#CEE3EE");
   final Color color26 = HexColor("#d0d0d0");
   final Color color28 = HexColor("#141414");
   final Color headerColorWithOpacity = HexColor("#c0bfc9");
   final Color color29 = HexColor("#EA1000");
   final Color color30 = HexColor("#D8D8D8");
   final Color color31 = HexColor("#E7E7E7");
   final Color emiColor = HexColor("#141414");
   final Color emiColor2 = HexColor("#464646");
   final Color emiColor3 = HexColor("#EBEBEB");
   final Color selfieBG = HexColor("#717171");
   final Color privateRManager = HexColor("#2F3D4B");
   final Color tamayuzRManagaer = HexColor("#002E5E");
   final Color color32 = HexColor("#E38A38");
   final Color color33 = HexColor("#947E64");
   final Color color34 = HexColor("#F3F3F3");
   final Color color35 = HexColor("#434243");
   final Color color36 = HexColor("#0175B2");
   final Color color37 = HexColor("#E37F0D");
   final Color color38 = HexColor("#702681");
   final Color color39 = HexColor("#049CDE");
   final Color color40 = HexColor("#E18026");
   final Color color41 = HexColor("#0000001F");
   final Color color42 = HexColor("#E18027");
   final Color color43 = HexColor("#707070");
   final Color color44 = HexColor("#003047");
   final Color color45 = HexColor("#FBECDE");
   final Color fifaText = HexColor("#FEBA00");
   final Color color46 = HexColor("#9c1e3d");
   final Color coloreipo = HexColor("#443444");
   // hardcorded colors .
   final Color color_46=HexColor("#EA0000");
   final Color color_47=HexColor("#260075B0");
   final Color color_48=HexColor("#DDDDDD");
   final Color color_49=HexColor('#E28732');
   final Color color_50=HexColor("#128002E45");
   final Color color_51=HexColor("#991032");
   final Color color_52=HexColor("#1A9AD5");
   final Color color_53=HexColor("#303030");
   final Color color_54=HexColor("#443444");
   final Color color_55=HexColor("#4C5358");
   final Color color_56=HexColor("#D53943");
   final Color color_57=HexColor("#292929");
   final Color color_58=HexColor("#737373");
   final Color color_59=HexColor("#0D0D0E");
   final Color color47 = HexColor("#E28631");
   final Color color48 = HexColor("#191919");
   final Color color49 = HexColor("#E6E6E6");
   final Color color50 = HexColor("#E3E3E3");
   final Color color51 = HexColor("#991032");
   final Color color52 = HexColor("#1A9AD5");
   final Color color53 = HexColor("#106EA9");
   final Color color54 = HexColor("#EAEAEA");

   //system colors
   final Color white=Colors.white;
   final Color black12=Colors.black12;
   final Color black45=Colors.black45;
   final Color black54=Colors.black54;
   final Color black87=Colors.black87;
   final Color transparent=Colors.transparent;
   final Color blue=Colors.blue;
   final Color grey=Colors.grey;
   // Color grey200=Colors.grey[200];
   // Color grey300=Colors.grey[300];
   final Color orange=Colors.orange;
   final Color green=Colors.green;
   final Color yellow=Colors.yellow;
   final Color red=Colors.red;
   final Color redAccent=Colors.redAccent;
   final Color purple=Colors.purple;
   // Account Colors
   final Color savingaccountColor=Colors.lime;
   final Color defaultcircle = HexColor("#049CDE");
   final Color currentAcountColor = HexColor("#6F2A7F");
   final Color certificateOfdeposit = HexColor("#19ACE4"); // certificate of deposit
   final Color sukuuk = HexColor("#808285");
   //My discount colors
   final Color  discounts_dinning=HexColor("#1B9DDB");
   final Color discounts_travel= HexColor("#63A70A");
   final Color discounts_shopping=HexColor("#E17F25");
   final Color discounts_lifestyle=HexColor("#6F2A7F");
   //main colors
   final Color segmentPrimaryColor= HexColor("#0075b0");
   final Color segmentSecoundaryColor= HexColor("#1B9DDB");
   final Color pgbcolordarkMode = HexColor("#B1B1B1");
   final Color buttondisablecolordak = HexColor("#7D7D7D");
   final Color homescreenaccontscolor = HexColor("#151515");
   final Color homescreenhedingcolor = HexColor("#636363");
   final Color colorHomeScreenback = HexColor("#F4F4F4");
   final Color timer_blue = HexColor('#1B9DDB');
   final Color secondarybuttoncolordark = HexColor('#808285');
   final Color secondarybuttontextcolordark = HexColor('#2F2F2F');
   final Color all_segments_white = Colors.white;
   final Color textcolordark = HexColor('#B1B1B1');
   final Color maleSegmentColor = HexColor("#6F2A7F");
   final Color femaleSegmentColor = HexColor("#63A70A");
   final Color cardcolor = HexColor('#0000001F');
   final Color dividercolor = HexColor('#737373');
   final Color hintcolordark = Colors.red;
   final Color linkcolor = HexColor("#00A1DE");
   final Color textColorInFrontOfDarkBGImage = Colors.white;
   final Color loginbg = HexColor("#434243");
   final Color btndarkcolor = HexColor("#808285");

   final Color dialogcolor = HexColor('#D9EAF3');
   final Color darkGrey = HexColor('#444344');
   final Color connectRM = HexColor('#937D62');
   final Color rm_container = HexColor("#00A1DE");
   final Color rm_container_text = Colors.white;
   final Color rm_container_list = HexColor("#83194B");
   final Color rm_container_list_title = HexColor("#887258");
   final Color underProcessBackgroundColor = HexColor('#FBECDF');

   final Color rm_logo = HexColor('#8A745A');
   final Color under_progress_orange = HexColor("#E17F25");
   final Color shadow = HexColor("#676463");
   final Color switchDeselectColor = HexColor("#CECECE");

   //categories
   final Color appliance_expenses = HexColor("#1275B0");
   final Color financial_services = HexColor("#E17F25");
   final Color shopping = HexColor("#09E9FF");
   final Color grocery = HexColor("#00A1DE");
   final Color dining = HexColor("#6F2A7F");
   final Color education = HexColor("#63A70A");
   final Color general_expenses = HexColor("#444344");
   final Color utility = HexColor("#042E5E");
   final Color charity_donations = HexColor("#E50000");
   final Color digital_goods = HexColor("#808285");
   final Color government_expenses= HexColor("#2BC431");
   final Color medical= HexColor("#83194B");
   final Color transportation_services= HexColor("#8A745A");
   final Color travel_leisure= HexColor("#339587");
   final Color others = HexColor("#F4AE02");


   //categories local
   final Color appliance_expenses_local = HexColor("#949494");
   final Color financial_services_local = HexColor("#B6B6B6");
   final Color shopping_local = HexColor("#C4C4C4");
   final Color grocery_local = HexColor("#A6A6A6");
   final Color dining_local = HexColor("#878787");
   final Color education_local = HexColor("#ACACAC");
   final Color general_expenses_local = HexColor("#858585");
   final Color utility_local = HexColor("#737373");
   final Color charity_donations_local = HexColor("#A7A7A7");
   final Color digital_goods_local = HexColor("#AEAEAE");
   final Color government_expenses_local= HexColor("#CBCBCB");
   final Color medical_local= HexColor("#747474");
   final Color transportation_services_local= HexColor("#A8A8A8");
   final Color travel_leisure_local= HexColor("#AFAFAF");
   final Color others_local = HexColor("#CCCCCC");

   final Color selected_period_no_data = HexColor("#9A999A");
   final Color previous_period_no_data = HexColor("#B4B4B4");
   final Color week_no_data_color = HexColor("#CECECE");
   final Color week_data_color = HexColor("#E0C4E6");
   final Color no_data_text_color = HexColor("#C3C3C3");
   final Color graph_background = HexColor("#F3F3F3");
   final Color timeline_chip_background = HexColor("#E3E3E3");
   final Color selected_period_previous_period_bg = HexColor("#EAEAEA");
   final Color graph_list_bg = Colors.grey;
   final Color tooltip_text_color = HexColor("#444344");

   final Color tool_tip_color = HexColor("#6F2A7F");
   final Color selected_period_graph_color = HexColor("#1375B0");
   final Color previous_period_graph_color = HexColor("#E17F25");
   final Color donut_chart_circles = Colors.white;

   final Color sideBannerColor  = HexColor("#1B9DDB");
   final Color popUpHeader  = HexColor("#6F2A7F");

  //QR Code Common color
  final Color all_segments_blue = Colors.blue;

   //multi payments
   final Color multiPaymentBanner = HexColor("#1B9DDB");
   final Color multiPaymentHeaderColor = HexColor("#6F2A7F");
   final Color multiPaymentWhite = Colors.white;
   final Color multiPaymentBackground = HexColor("#F4F4F4");
//generate swift
  final Color swift_unavailable = HexColor("#FEC7C7");


   Widget getStatusBarHeader() {
    return Container(
      width: double.infinity,
      height: responsiveHeight(43.0),
      decoration: BoxDecoration(
        color: color6,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(responsiveWidth(20.0)),
          bottomRight: Radius.circular(responsiveWidth(20.0)),
        ),
      ),
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

  String getSemiBoldFont() {
    var language = getUserCurrentLanguageInMemory();
    if (language == "en_US" ||
        language == null ||
        language.toString().isEmpty) {
      return "OpenSans-SemiBold";
    } else {
      return "OpenSans-SemiBold";
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
    return GainGermsText(
            typo: Typo.H7, color: ColorUility().errorRedColor(), isBold: true)
        .style();
  }

  OutlineInputBorder enableOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide:
          BorderSide(color: ColorUility().enableGreyColor(), width: 1.0),
      borderRadius: BorderRadius.all(
        Radius.circular(responsiveWidth(15.0)),
      ),
    );
  }

  OutlineInputBorder focusedOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide:
          BorderSide(color: ColorUility().focusedBlueColor(), width: 1.0),
      borderRadius: BorderRadius.all(
        Radius.circular(responsiveWidth(15.0)),
      ),
    );
  }

  OutlineInputBorder errorOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: ColorUility().errorRedColor(), width: 1.0),
      borderRadius: BorderRadius.all(
        Radius.circular(responsiveWidth(15.0)),
      ),
    );
  }

  OutlineInputBorder searchDisableOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide:
          BorderSide(color: ColorUility().disableGreyColor(), width: 1.0),
      borderRadius: BorderRadius.all(
        Radius.circular(responsiveWidth(15.0)),
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
      color: GainGermsTheme().getTheme().black.withOpacity(.1),
      blurRadius: 6.0, // soften the shadow
      spreadRadius: 0.0, //extend the shadow
      offset: Offset(
        0.0,
        1.0,
      ),
    );
  }

  BoxShadow customerButtonCardShadowEffectDark() {
    return BoxShadow(

      color: GainGermsTheme().getTheme().cardcolor,
      blurRadius: 12.0, // soften the shadow
      spreadRadius: 0.0, //extend the shadow
      offset: Offset(
        0.0,
        8.0,
      ),
    );
  }

   BoxDecoration creditCardShadow(Color backgroundColor, {double? shadowBlur, Offset? offset}) {
     return BoxDecoration(
       color: backgroundColor,
       borderRadius: BorderRadius.all(Radius.circular(responsiveWidth(10))),
       boxShadow: [
         BoxShadow(
           color: GainGermsTheme().getTheme().black.withOpacity(.3),
           blurRadius: shadowBlur ?? 15.0, // soften the shadow
           spreadRadius: 0.0, //extend the shadow
           offset: offset ?? Offset(
             0.0,
             9.0,
           ),
         )
       ],
     );
   }

   BoxDecoration creditCardShadowDark(Color backgroundColor, {double? shadowBlur, Offset? offset}) {
     return BoxDecoration(
       color: backgroundColor,
       borderRadius: BorderRadius.all(Radius.circular(responsiveWidth(10))),
       boxShadow: [
         BoxShadow(
           color: GainGermsTheme().getTheme().white,
           blurRadius: shadowBlur ?? 15.0, // soften the shadow
           spreadRadius: 0.0, //extend the shadow
           offset: offset ?? Offset(
             0.0,
             9.0,
           ),
         )
       ],
     );
   }

  BoxDecoration containerButtonDecoration(Color? backgroundColor,{bool? isColor,Color? myColor, BoxShadow? customShadow,double? radius=20}) {
     if (GainGermsTheme().isDarkMode() && isColor!=null) {
       if(isColor==false) {
         return BoxDecoration(
           color:
           GainGermsTheme().isDarkMode() ? GainGermsTheme()
               .getTheme()
               .homescreenaccontscolor :
           backgroundColor,
           borderRadius: BorderRadius.all(
               Radius.circular(responsiveWidth(radius!=null?radius:20))),
           boxShadow:GainGermsTheme().isDarkMode()?null: [Style().customerButtonCardShadowEffect()],
         );
       }
       else{
         return BoxDecoration(
           color: GainGermsTheme().isDarkMode() ? (myColor ?? backgroundColor) : backgroundColor,
           borderRadius: BorderRadius.all(
               Radius.circular(responsiveWidth(radius!=null?radius:20))),
           boxShadow:GainGermsTheme().isDarkMode()?[customShadow??Style().customerButtonCardShadowEffectDark()]: [Style().customerButtonCardShadowEffect()],
         );
       }
     }
    return BoxDecoration(
      color: GainGermsTheme().isDarkMode()?GainGermsTheme().getTheme().color1:backgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(responsiveWidth(radius!=null?radius:20))),
      boxShadow: GainGermsTheme().isDarkMode()?[customShadow??Style().customerButtonCardShadowEffectDark()]:[Style().customerButtonCardShadowEffect()],
    );
  }




   BoxDecoration containerProductCardDecoration(Color? backgroundColor) {
     return BoxDecoration(
       color: backgroundColor,
       borderRadius: BorderRadius.all(Radius.circular(responsiveWidth(20))),
       boxShadow: [Style().customerButtonCardShadowEffect()],
     );
   }

  BoxDecoration qibButtonDecoration(
      Color? backgroundColor, Color? borderColor, bool? isDisabled,bool? removeOutline) {

     if (removeOutline!=null && removeOutline) {
           return BoxDecoration(
             color: backgroundColor,
             border: Border.all(color:GainGermsTheme().isDarkMode()?Colors.transparent:borderColor ?? Colors.transparent),
             borderRadius: BorderRadius.all(Radius.circular(responsiveWidth(20))),
             boxShadow: isDisabled != null && isDisabled == true
                 ? null
                 : GainGermsTheme().isDarkMode()?[Style().customerButtonCardShadowEffectDark()]:[Style().customerButtonCardShadowEffect()],
           );
     }


    return BoxDecoration(
      color: backgroundColor,
      border: Border.all(color:GainGermsTheme().isDarkMode()?GainGermsTheme().getTheme().color1:borderColor ?? Colors.transparent),
      borderRadius: BorderRadius.all(Radius.circular(responsiveWidth(20))),
      boxShadow: isDisabled != null && isDisabled == true
          ? null
          : GainGermsTheme().isDarkMode()?[Style().customerButtonCardShadowEffectDark()]:[Style().customerButtonCardShadowEffect()],
    );
  }

  BoxDecoration footerDecoration(Color backgroundColor) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(responsiveWidth(20))),
      boxShadow: [Style().footerShadowEffect()],
    );
  }

  BoxShadow footerShadowEffect() {
    return BoxShadow(
      color: GainGermsTheme().isDarkMode()?GainGermsTheme().getTheme().white:GainGermsTheme().getTheme().black.withOpacity(.2),
      blurRadius: responsiveWidth(5.0),
      spreadRadius: 0.0,
      offset: Offset(0.0, 0.1), // shadow direction: bottom right
    );
  }

  BoxShadow smartBtnShadowEffect() {
    return BoxShadow(
      color: GainGermsTheme().getTheme().black.withOpacity(.2),
      blurRadius: responsiveWidth(5.0),
      spreadRadius: 0.0, //extend the shadow
      offset: Offset(
        0.0, // Move to right 10  horizontally
        15.0, // Move to bottom 10 Vertically
      ),
    );
  }

  BoxDecoration containerCardDecoration(Color backgroundColor,{Color? myColorDarkMode, bool showShadow = true}) {

     if(myColorDarkMode!=null){
       return BoxDecoration(
           color: GainGermsTheme().isDarkMode()?myColorDarkMode:backgroundColor,
           borderRadius: BorderRadius.all(Radius.circular(responsiveWidth(20))),
           border: !showShadow ? Border.all(color: GainGermsTheme().getTheme().color31, width: 1) : null,
           boxShadow :showShadow ? [Style().customerCardShadowEffect()] : null
       );
     }
     return BoxDecoration(
         color: GainGermsTheme().isDarkMode()?GainGermsTheme().getTheme().color1:backgroundColor,
         borderRadius: BorderRadius.all(Radius.circular(responsiveWidth(20))),
         border: !showShadow ? Border.all(color: GainGermsTheme().getTheme().color31, width: 1) : null,
         boxShadow :showShadow ? [Style().customerCardShadowEffect()] : null
     );
  }

  BoxDecoration containerCardDecorationWithOutShadow(Color backgroundColor, {Color? borderColor}) {
    return BoxDecoration(
        color: GainGermsTheme().isDarkMode()?GainGermsTheme().getTheme().color1:backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(responsiveWidth(20))),
        border: Border.all(color:  borderColor ?? GainGermsTheme().getTheme().color3, width: 1.0));
  }

  BoxDecoration activityCardDecoration(
      Color? backgroundColor, Color? borderColor) {
    return BoxDecoration(
        color: GainGermsTheme().isDarkMode()?GainGermsTheme().getTheme().color1:backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(responsiveWidth(20))),
        border: Border.all(color: GainGermsTheme().isDarkMode()?GainGermsTheme().getTheme().color3:borderColor ??  GainGermsTheme().getTheme().color3, width: 1.0));
  }

  BoxDecoration activityCardDecorationLinkDeLink(
      Color? backgroundColor, Color? borderColor) {
    return BoxDecoration(
        color: GainGermsTheme().isDarkMode()?GainGermsTheme().getTheme().color1:backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(responsiveWidth(15))),
        border: Border.all(color: GainGermsTheme().isDarkMode()?GainGermsTheme().getTheme().color3:borderColor ??  GainGermsTheme().getTheme().color3, width: 1.0));
  }

  BoxDecoration containerCardDecorationWithOutShadowNStorke(
      Color backgroundColor) {
    return BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(responsiveWidth(17))));
    // border: Border.all(color: color3, width: 1.0));
  }

  BoxDecoration containerCardDecorationWithOutShadowRadius(
      Color backgroundColor, double radius) {
    return BoxDecoration(
        color: GainGermsTheme().isDarkMode()?GainGermsTheme().getTheme().color1:backgroundColor,
        borderRadius:
            BorderRadius.all(Radius.circular(responsiveWidth(radius))),
        border: Border.all(color: GainGermsTheme().getTheme().color3, width: 1.0));
  }

  BoxDecoration selectDecorationWithBorder(
      Color backgroundColor, Color borderColor) {
    return BoxDecoration(
        color: GainGermsTheme().isDarkMode()?GainGermsTheme().getTheme().cardcolor:backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(responsiveWidth(15))),
        border: Border.all(color: GainGermsTheme().isDarkMode()?GainGermsTheme().getTheme().color3:borderColor, width: 1.0));
  }

  BoxDecoration containerCardDecorationWithBorder(
      Color backgroundColor, Color borderColor) {
    return BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(responsiveWidth(20))),
        border: Border.all(color: GainGermsTheme().isDarkMode()?GainGermsTheme().getTheme().color3:borderColor, width: 1.0));
  }

  BoxDecoration containerCardDecorationTransparent() {
    return BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(0)),
        border: Border.all(color: Colors.transparent, width: 0.0));
  }

  BoxDecoration containerBottomBorderRadius(
      Color backgroundColor, double radius, bool showShadow) {
    return BoxDecoration(
      color: GainGermsTheme().isDarkMode()?GainGermsTheme().getTheme().color1:backgroundColor,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(responsiveWidth(radius)),
          bottomRight: Radius.circular(responsiveWidth(radius))),
      boxShadow: showShadow ? [Style().customerCardShadowEffect()] : [],
    );
  }

  BoxDecoration containerTopBorderRadius(
      Color backgroundColor, double radius, bool showShadow) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(responsiveWidth(radius)),
          topRight: Radius.circular(responsiveWidth(radius))),
      boxShadow: showShadow ? [Style().customerCardShadowEffect()] : [],
    );
  }

  BoxDecoration containerCardDecorationWithShadow(Color backgroundColor) {
    return BoxDecoration(
        color: GainGermsTheme().isDarkMode()?GainGermsTheme().getTheme().color1:backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(width: 1.0, color:  GainGermsTheme().getTheme().color3));
  }

  BoxDecoration containerTopBorderRadiusWithOutShadow(Color backgroundColor) {
    return BoxDecoration(
        color: GainGermsTheme().isDarkMode()?GainGermsTheme().getTheme().color1:backgroundColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(responsiveWidth(20)),
            topRight: Radius.circular(responsiveWidth(20))),
        border: Border.all(width: 1.0, color:  GainGermsTheme().getTheme().color3));
  }

  BoxDecoration pageHeaderBanner([Color? background]) {

     if(GainGermsTheme().isDarkMode()){
       return BoxDecoration(
         color: background ?? GainGermsTheme().getTheme().color1.withOpacity(0.6),
         borderRadius: BorderRadius.only(
           bottomLeft: Radius.circular(responsiveWidth(20.0)),
           bottomRight: Radius.circular(responsiveWidth(20.0)),
         ),
       );
     }else
       {
         return BoxDecoration(
           color: background ?? Style().color8,
           borderRadius: BorderRadius.only(
             bottomLeft: Radius.circular(responsiveWidth(20.0)),
             bottomRight: Radius.circular(responsiveWidth(20.0)),
           ),
         );
       }

  }

   BoxDecoration multiplePaymentBanner([Color? background]) {

     if(GainGermsTheme().isDarkMode()){
       return BoxDecoration(
         color: background ?? GainGermsTheme().getTheme().color1.withOpacity(0.6),
         borderRadius: BorderRadius.only(
           topLeft: Radius.circular(responsiveWidth(20.0)),
           topRight: Radius.circular(responsiveWidth(20.0)),
         ),
       );
     }else
     {
       return BoxDecoration(
         color: background ?? Style().color8,
         borderRadius: BorderRadius.only(
           topLeft: Radius.circular(responsiveWidth(20.0)),
           topRight: Radius.circular(responsiveWidth(20.0)),
         ),
       );
     }

   }

  BoxDecoration pageHeaderBannerImage([String? background]) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(background!),
        fit: BoxFit.fill,
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(responsiveWidth(20.0)),
        bottomRight: Radius.circular(responsiveWidth(20.0)),
      ),
    );
  }
}
