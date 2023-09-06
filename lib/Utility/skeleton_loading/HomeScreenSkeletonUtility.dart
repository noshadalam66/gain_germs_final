import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gain_germs_final/Utility/skeleton_loading/shimmer_Effect.dart';

import '../../Models/commonmodel.dart';
import '../../Theme/size_config.dart';
import '../../Theme/theme.dart';

Widget horizontalbar(double width, double height, {Color? color}) {
  return ShimmerEffect.fromColors(
    highlightColor: color == null ?GainGermsTheme().getTheme().white:GainGermsTheme().getTheme().colorHomeScreenback,
    baseColor: color == null ? GainGermsTheme().getTheme().color8 : color,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color == null ? GainGermsTheme().getTheme().color8 : color),
    ),
  );
}

Widget getcolumnvertical (context){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      horizontalbar(MediaQuery.of(context).size.width/2, 13, color: GainGermsTheme().getTheme().color27),
      SizedBox(height: 10,),
      horizontalbar(MediaQuery.of(context).size.width/1.5, 16, color: GainGermsTheme().getTheme().color27),

    ],
  );
}

Widget buildhorizontaltwotab(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 0.0, right: 0,top: 10,bottom: 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        horizontalbar(MediaQuery.of(context).size.width / 1.8, 13,
            color: GainGermsTheme().getTheme().color27),
        SizedBox(width: 10),
        horizontalbar(MediaQuery.of(context).size.width / 4, 13,
            color: GainGermsTheme().getTheme().color27),
      ],
    ),
  );
}
Widget buildContainerBoxlistitemone(context) {
  return ContainerBox(
    isRight: true,
    height: responsiveHeight(80),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            horizontalbar(100, 18),
            horizontalbar(100, 18),


          ],
        ),
        horizontalbar(MediaQuery.of(context).size.width / 1.3, 13),

      ],
    ),
  );
}

Widget buildContainerBoxlistitemtwo() {
  return ContainerBox(
    isRight: true,
    height: responsiveHeight(80),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        // CircleAvatar(radius: responsiveHeight(25),backgroundColor: QIBTheme().getTheme().color8,),
        SizedBox(width: 10,),
        Column(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            horizontalbar(100, 18),
            horizontalbar(100, 10),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: horizontalbar(100, 18),
            )),
      ],
    ),
  );
}

ContainerBox buildContainerBoxlistitem() {
  return ContainerBox(
    isRight: true,
    height: responsiveHeight(80),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        CircleAvatar(
          radius: responsiveHeight(25),
          backgroundColor: GainGermsTheme().getTheme().color8,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: getUserCurrentLanguageInMemory() != "en_US"?CrossAxisAlignment.start:CrossAxisAlignment.start,
          children: [
            horizontalbar(100, 10),
            horizontalbar(60, 10),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: Align(
                alignment: getUserCurrentLanguageInMemory() != "en_US"?Alignment.centerLeft:Alignment.centerRight,
                child: CircleAvatar(
                  radius: responsiveHeight(15),
                  backgroundColor: GainGermsTheme().getTheme().color8,
                ))),
      ],
    ),
  );
}
ContainerBox buildContainerBoxListItem() {
  return ContainerBox(
    height: 180,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: SvgPicture.asset(
                'assets/images/common/placeholderimage.svg',
              ),
            ),
            horizontalbar(60, 12),
            horizontalbar(60, 12)
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            horizontalbar(60, 12),
            horizontalbar(150, 18),
            SizedBox(
              height: 20,
            ),
            horizontalbar(60, 12),
            horizontalbar(150, 18)
          ],
        )
      ],
    ),
    isRight: true,
  );
}
Widget buildAbsher() {
  return ContainerBox(
    height: 220,
    color: GainGermsTheme().getTheme().color8,
    isRight: true,
    child: Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            horizontalbar(200, 20,
                color: GainGermsTheme().getTheme().color27),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                horizontalbar(150, 10,
                    color: GainGermsTheme().getTheme().color27),
                SizedBox(
                  height: 10,
                ),
                horizontalbar(130, 10,
                    color: GainGermsTheme().getTheme().color27),
                SizedBox(
                  height: 10,
                ),
                horizontalbar(100, 10,
                    color: GainGermsTheme().getTheme().color27),
              ],
            ),
            horizontalbar(100, 20,
                color: GainGermsTheme().getTheme().color27)
          ],
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: GainGermsTheme().getTheme().color27, width: 25),
                // borderRadius: BorderRadius.all(Radius.circular(20)),
                shape: BoxShape.circle),
            height: 150,
            width: 100,
          ),
        )
      ],
    ),
  );
}
Container buildTilesCircleBar() {
  return Container(
    height: 90,
    padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
    child: Column(
      children: [
        CircleAvatar(
          radius: responsiveWidth(25),
          backgroundColor: GainGermsTheme().getTheme().color27,
        ),
        SizedBox(
          height: 5,
        ),
        // horizontalbar(responsiveWidth(50), 10),
        Container(
          height: 10,
          width: responsiveWidth(60),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: GainGermsTheme().getTheme().color27),
        )
      ],
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: GainGermsTheme().getTheme().color8),
  );
}
Widget buildTilesCircleBarone() {
  return Container(
    height: 90,
    padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
    child: Column(
      children: [
        CircleAvatar(
          radius: responsiveWidth(25),
          backgroundColor: GainGermsTheme().getTheme().color8,
        ),
        SizedBox(
          height: 5,
        ),
        // horizontalbar(responsiveWidth(50), 10),
        Container(
          height: 10,
          width: responsiveWidth(60),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: GainGermsTheme().getTheme().color8),
        )
      ],
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: GainGermsTheme().getTheme().color27),
  );
}
Widget buildViewpager(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: 15,
      ),
      Padding(
        padding: const EdgeInsets.only(left:20.0,right: 20),
        child: buildhorizontaltwotab(context),
      ),
      SizedBox(
        height: 15,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 15.0, left: 15),
        child: SvgPicture.asset(
          'assets/images/common/placeholderimage.svg',
          width: MediaQuery.of(context).size.width,
          // height: 150,
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 5,
            backgroundColor: GainGermsTheme().getTheme().color27,
          ),
          SizedBox(
            width: 5,
          ),
          CircleAvatar(
            radius: 5,
            backgroundColor: GainGermsTheme().getTheme().color8,
          ),
          SizedBox(
            width: 5,
          ),
          CircleAvatar(
            radius: 5,
            backgroundColor: GainGermsTheme().getTheme().color8,
          ),
          SizedBox(
            width: 5,
          ),
          CircleAvatar(
            radius: 5,
            backgroundColor: GainGermsTheme().getTheme().color8,
          ),
        ],
      ),
      SizedBox(
        height: 15,
      ),
      horizontalbar(double.infinity, responsiveHeight(3.0),),

    ],
  );
}
Widget buildManageButton(context){
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: ContainerBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: responsiveWidth(15),
            backgroundColor: GainGermsTheme().getTheme().color8,
          ),
          SizedBox(width: 10,),
          horizontalbar(MediaQuery.of(context).size.width/2.4, 10)

        ],
      ),

    ),
  );


}
class ContainerBox extends StatelessWidget {
  final Widget? child;
  final double? height;
  final bool? isRight;
  final Color? color;

  ContainerBox({this.child, this.height, this.isRight, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),color: color == null ? GainGermsTheme().getTheme().color27 : color!),
      padding: EdgeInsets.all(8.0),
      height: height!,
      width: double.infinity,
      child: child!,
    );
  }
}



