import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gain_germs_final/Utility/skeleton_loading/shimmer_Effect.dart';

import '../../Theme/size_config.dart';
import '../../Theme/theme.dart';

Widget StaticSkeleton() {
  return Padding(
    padding: const EdgeInsets.only(left: 0.0, right: 0, top: 10, bottom: 0),
    child: Column(children: [
      SizedBox(
        height: 20,
      ),
      singleLineTwoBars(),
      SizedBox(
        height: 20,
      ),
      singleBarLine(),
      SizedBox(
        height: 20,
      ),
    ]),
  );
}

Widget CardImageSkeleton(BuildContext context) {
  return ContainerBox(
    height: 200,
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
            horizontalBar(60, 12),
            horizontalBar(60, 12)
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            horizontalBar(60, 12),
            horizontalBar(150, 18),
            SizedBox(
              height: 20,
            ),
            horizontalBar(60, 12),
            horizontalBar(150, 18)
          ],
        )
      ],
    ),
    isRight: true,
  );
}

Widget TakafulInsauranceSkeleton() {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: GainGermsTheme().getTheme().color27),
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.only(left: 10, right: 10),
      height: responsiveHeight(190),
      width: double.infinity,
      child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: responsiveHeight(10),
                      backgroundColor: GainGermsTheme().getTheme().color8,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          horizontalBar(
                            responsiveWidth(130),
                            responsiveHeight(18),
                          ),
                          horizontalBar(
                            responsiveWidth(90),
                            responsiveHeight(18),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: horizontalBar(
                    responsiveWidth(75),
                    responsiveHeight(15),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      horizontalBar(
                        responsiveWidth(60),
                        responsiveHeight(13),
                      ),
                      horizontalBar(
                        responsiveWidth(90),
                        responsiveHeight(13),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      horizontalBar(
                        responsiveWidth(90),
                        responsiveHeight(13),
                      ),
                      horizontalBar(
                        responsiveWidth(50),
                        responsiveHeight(13),
                      ),
                    ],
                  ),
                ),
              ])));
}

Widget horizontalBar(double width, double height, {Color? color}) {
  return ShimmerEffect.fromColors(
    highlightColor: color == null
        ? GainGermsTheme().getTheme().color27
        : GainGermsTheme().getTheme().white,
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

Widget SingleParallelLine() {
  return ShimmerEffect.fromColors(
    highlightColor: GainGermsTheme().getTheme().white,
    baseColor: GainGermsTheme().getTheme().color8,
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          horizontalBar(
            responsiveWidth(120),
            responsiveHeight(12),
          ),
          horizontalBar(
            responsiveWidth(100),
            responsiveHeight(12),
          ),
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
          borderRadius: BorderRadius.circular(10),
          color: GainGermsTheme().getTheme().color27),
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.only(left: 10, right: 10),
      // padding: EdgeInsets.all(8.0),
      // margin: EdgeInsets.only(left: 20, right: isRight == null ? 0 : 20),
      height: height!,
      width: double.infinity,
      child: child!,
    );
  }
}

Widget singleBarLine() {
  return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(15.0),
      child: horizontalBar(
        responsiveWidth(80),
        responsiveHeight(10),
      ));
}

Widget getContainerListBlock() {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: GainGermsTheme().getTheme().color27),
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.only(left: 20, right: 20),
      height: responsiveHeight(110),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: responsiveHeight(8),
                backgroundColor: GainGermsTheme().getTheme().color8,
              ),
              horizontalBar(
                responsiveWidth(120),
                responsiveHeight(12),
              ),
              horizontalBar(
                responsiveWidth(100),
                responsiveHeight(12),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 28),
            child: horizontalBar(
              responsiveWidth(180),
              responsiveHeight(8),
            ),
          )
        ]),
      ));
}

Widget reverseContainerListBlock() {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: GainGermsTheme().getTheme().color27),
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.only(left: 20, right: 20),
      height: responsiveHeight(90),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: responsiveHeight(6),
                backgroundColor: GainGermsTheme().getTheme().color8,
              ),
              SizedBox(
                width: 10,
              ),
              horizontalBar(
                responsiveWidth(100),
                responsiveHeight(12),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                horizontalBar(
                  responsiveWidth(150),
                  responsiveHeight(8),
                ),
                horizontalBar(
                  responsiveWidth(100),
                  responsiveHeight(12),
                ),
              ],
            ),
          ),
        ]),
      ));
}

Widget BottomMenu(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: GainGermsTheme().getTheme().color27),
    // padding: EdgeInsets.all(10.0),
    margin: EdgeInsets.only(left: 20, right: 20),
    width: MediaQuery.of(context).size.width,
    height: responsiveHeight(100),
    child: Stack(
      children: [
        Positioned(
          bottom: 10,
          left: 10,
          child: bottomCircleLine(),
        ),
        Positioned(
          bottom: 10,
          left: 80,
          child: bottomCircleLine(),
        ),
        Positioned(
          bottom: 10,
          left: 150,
          child: bottomCircleLine(),
        ),
        Positioned(
          bottom: 10,
          left: 220,
          child: bottomCircleLine(),
        ),
      ],
    ),
  );
}

Widget bottomCircleLine() {
  return Padding(
    padding: EdgeInsets.all(10.0),
    child: Row(
      children: [
        Column(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ShimmerEffect.fromColors(
              baseColor: Colors.white,
              highlightColor: GainGermsTheme().getTheme().color27,
              child: CircleAvatar(
                radius: responsiveHeight(25),
                backgroundColor: GainGermsTheme().getTheme().color8,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            horizontalBar(
              responsiveWidth(70),
              responsiveHeight(8),
            )
          ],
        ),
      ],
    ),
  );
}

Widget centerCircle() {
  return Padding(
    padding: EdgeInsets.all(10.0),
    child: CircleAvatar(
      radius: responsiveHeight(25),
      backgroundColor: GainGermsTheme().getTheme().yellow,
    ),
  );
}

Widget singleLineTwoBars() {
  return Padding(
    padding: EdgeInsets.only(left: 15.0, right: 15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        horizontalBar(
          responsiveWidth(150),
          responsiveHeight(15),
        ),
        horizontalBar(
          responsiveWidth(100),
          responsiveHeight(15),
        ),
      ],
    ),
  );
}

Container buildCircleBar() {
  return Container(
    height: 100,
    padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
    child: Column(
      children: [
        CircleAvatar(
          radius: responsiveWidth(28),
          backgroundColor: GainGermsTheme().getTheme().color27,
        ),
        SizedBox(
          height: 10,
        ),
        // horizontalbar(responsiveWidth(50), 10),
        Container(
          height: 10,
          width: responsiveWidth(70),
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
