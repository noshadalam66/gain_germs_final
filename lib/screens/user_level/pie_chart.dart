import '../../chart/resources/app_resources.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import '../../screens/dashboard/components/fl_touch_event.dart';


// class UserLevelPieChart extends StatefulWidget {
//   const UserLevelPieChart({super.key});
//
//   @override
//   UserLevelPieChartState createState() => UserLevelPieChartState();
// }

// class UserLevelPieChartState extends State<UserLevelPieChart> {
class UserLevelPieChart extends StatelessWidget {
  // int touchedIndex = 0;
  double radius = 0.0;
  double ration = 0.0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if(size.width>1300) {
      radius = 160.0;//desktop
      ration = 1.3;
    }else if(size.width>900){
      radius = 140.0;//tablet
      ration = 2.5;
    }else if(size.width>600){
      radius = 100.0;//mobile
      ration = 2.0;
    }else if(size.width<600){
      radius = 100.0;//mobile
      ration = 1.8;
    }
    return AspectRatio(
      aspectRatio: ration, //make it 1
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(
            // touchCallback: (FlTouchEvent event, pieTouchResponse) {
            //   setState(() {
            //     if (!event.isInterestedForInteractions ||
            //         pieTouchResponse == null ||
            //         pieTouchResponse.touchedSection == null) {
            //       touchedIndex = -1;
            //       return;
            //     }
            //     touchedIndex =
            //         pieTouchResponse.touchedSection!.touchedSectionIndex;
            //   });
            // },
          ),
          borderData: FlBorderData(
            show: false,
          ),
          sectionsSpace: 0,
          centerSpaceRadius: 0,
          sections: showingSections(),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(6, (i) {
      // final isTouched = i == touchedIndex;
      final fontSize = 0.0;//isTouched ? 20.0 : 16.0;
      // final radius = 140.0;//isTouched ? 150.0 : 135.0;
      // final radius = isTouched ? 110.0 : 100.0;
      // final widgetSize = isTouched ? 55.0 : 40.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.contentColorBlue,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            // badgeWidget: _Badge(
            //   'assets/icons/ophthalmology-svgrepo-com.svg',
            //   size: widgetSize,
            //   borderColor: AppColors.contentColorBlack,
            // ),
            // badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.contentColorYellow,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            // badgeWidget: _Badge(
            //   'assets/icons/librarian-svgrepo-com.svg',
            //   size: widgetSize,
            //   borderColor: AppColors.contentColorBlack,
            // ),
            // badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.contentColorPurple,
            value: 16,
            title: '16%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            // badgeWidget: _Badge(
            //   'assets/icons/fitness-svgrepo-com.svg',
            //   size: widgetSize,
            //   borderColor: AppColors.contentColorBlack,
            // ),
            // badgePositionPercentageOffset: .98,
          );
        case 3:
          return PieChartSectionData(
            color: AppColors.contentColorGreen,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            // badgeWidget: _Badge(
            //   'assets/icons/worker-svgrepo-com.svg',
            //   size: widgetSize,
            //   borderColor: AppColors.contentColorBlack,
            // ),
            // badgePositionPercentageOffset: .98,
          );
        case 4:
          return PieChartSectionData(
            color: AppColors.contentColorGreen,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            // badgeWidget: _Badge(
            //   'assets/icons/worker-svgrepo-com.svg',
            //   size: widgetSize,
            //   borderColor: AppColors.contentColorBlack,
            // ),
            // badgePositionPercentageOffset: .98,
          );
        case 5:
          return PieChartSectionData(
            color: AppColors.contentColorGreen,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            // badgeWidget: _Badge(
            //   'assets/icons/worker-svgrepo-com.svg',
            //   size: widgetSize,
            //   borderColor: AppColors.contentColorBlack,
            // ),
            // badgePositionPercentageOffset: .98,
          );
        default:
          throw Exception('Oh no');
      }
    });
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
      this.svgAsset, {
        required this.size,
        required this.borderColor,
      });
  final String svgAsset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: SvgPicture.asset(
          svgAsset,
        ),
      ),
    );
  }
}
