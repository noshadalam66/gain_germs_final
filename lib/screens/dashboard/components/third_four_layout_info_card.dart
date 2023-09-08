import 'dart:math';

// import '../../../../Models/MyFiles.dart';
import '../../../Models/user_details.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/constants.dart';

import '../../../Models/commonmodel.dart';
import '../../../Models/random_winner_model.dart';

class ThirdFourLayoutInfoCard extends StatelessWidget {
  const ThirdFourLayoutInfoCard({
    Key? key,
    required this.info, required this.index
  }) : super(key: key);

  final UserResponse? info;
  final int index;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String firstText = "", secondText = "", iconString = "";
    if(index == 0){
      int tg = int.parse(info?.customerData?.totalGains ?? "0");
      double gp = double.parse(info?.customerData?.gainPrice ?? "0.0");
      double amount = tg * gp;

      firstText = "USD" + " " + "${amount.toStringAsFixed(2)}";
      secondText = "Balance";
      iconString = "assets/images/roll.png";
    }else if(index == 1){
      firstText = "${info?.customerData?.totalGains}"  + " " + "Germs";
      secondText = "Balance";
      iconString = "assets/images/card.png";
    }else if(index == 2){
      firstText = "USD" + " " + "${info?.customerData?.gainPrice}";
      secondText = "Germs Price";
      iconString = "assets/images/graph.png";
    }else if(index == 3){
      firstText = "${info?.customerData?.depositedGains}"  + " " + "Germs";
      secondText = "Deposits";
      iconString = "assets/images/deposit.png";
    }

    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text(
                firstText,
                style: headingOne(size, Colors.white),
              ),
              Text(
                secondText,
                style: headingTwoNotBold(size, Colors.white),
              ),
            ]
          ),
          index == 0 ? Container(
            padding: EdgeInsets.all(defaultPadding * 0.65),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: getColorr(Random().nextInt(20)).withOpacity(0.1),
              // color: info.color!.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Image.asset(
              iconString,
              height: 22,
              color: getColorr(Random().nextInt(20)).withOpacity(0.9),
              // color: info.color!.withOpacity(0.9),
            ),
          ) :
          index == 1 ? Container(
            padding: EdgeInsets.all(defaultPadding * 0.65),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: getColorr(Random().nextInt(20)).withOpacity(0.1),
              // color: info.color!.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Image.asset(
              iconString,
              height: 22,
              color: getColorr(Random().nextInt(20)).withOpacity(0.9),
              // color: info.color!.withOpacity(0.9),
            ),
          ) :
          index == 2 ? Container(
            padding: EdgeInsets.all(defaultPadding * 0.65),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: getColorr(Random().nextInt(20)).withOpacity(0.1),
              // color: info.color!.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Image.asset(
              iconString,
              height: 22,
              color: getColorr(Random().nextInt(20)).withOpacity(0.9),
              // color: info.color!.withOpacity(0.9),
            ),
          ) :
          index == 3 ? Container(
            padding: EdgeInsets.all(defaultPadding * 0.65),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: getColorr(Random().nextInt(20)).withOpacity(0.1),
              // color: info.color!.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Image.asset(
              iconString,
              height: 22,
              color: getColorr(Random().nextInt(20)).withOpacity(0.9),
              // color: info.color!.withOpacity(0.9),
            ),
          ) : Container(),
          // Icon(Icons.more_vert, color: Colors.white54)
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
