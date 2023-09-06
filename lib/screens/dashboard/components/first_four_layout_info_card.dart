import 'dart:math';

import '../../../Models/MyFiles.dart';
import '../../../Models/random_winner_model.dart';
import '../../../Models/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../constants/constants.dart';

import '../../../Models/commonmodel.dart';

class FirstFourLayoutInfoCard extends StatelessWidget {
  const FirstFourLayoutInfoCard({
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
      firstText = "${info?.customerData?.totalSpinRolled}";
      secondText = 'rolls'.tr().toString();
      iconString = "assets/images/roll.png";
    }else if(index == 1){
      firstText = "${info?.customerData?.noOfReferrals}";
      secondText = 'invited'.tr().toString();
      iconString = "assets/images/referrals.png";
    }else if(index == 2){
      firstText = "${info?.customerData?.totalSignedContract}";
      secondText = 'smart_contracts'.tr().toString();
      iconString = "assets/images/smart_contract.png";
    }else if(index == 3){
      firstText = "${info?.customerData?.totalVideoWatched}";
      secondText = 'watched_videos'.tr().toString();
      iconString = "assets/images/videos.png";
    }
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Container(
                  padding: EdgeInsets.all(defaultPadding * 0.75),
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
                ),
                Text(
                  firstText,
                  maxLines: 1,
                  style: headingOne(size*1.2, Colors.white),
                ),
                Text(
                  secondText,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
              ]
          ),
          // Icon(Icons.more_vert, color: Colors.white54)
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
