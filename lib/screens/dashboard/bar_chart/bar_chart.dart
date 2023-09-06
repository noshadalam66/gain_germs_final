// import '../../Theme/theme.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import '../../screens/dashboard/bar_chart/bar_chart_data.dart';
//
// class BarChartContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BarChart(BarChartData(
//       titlesData: FlTitlesData(
//         bottomTitles: SideTitles(
//           showTitles: true,
//           // getTextStyles: (value) => TextStyle(
//           //     color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
//           getTitles: (value) {
//             switch (value.toInt()) {
//               case 1:
//                 return 'Mon';
//               case 2:
//                 return 'Tues';
//               case 3:
//                 return 'Wed';
//               case 4:
//                 return 'Thu';
//               case 5:
//                 return 'Fri';
//               case 6:
//                 return 'Sat';
//               case 7:
//                 return 'Sun';
//             }
//             return '';
//           },
//         ),
//         leftTitles: SideTitles(
//           interval: 2,
//           showTitles: true,
//           // getTextStyles: (value) => TextStyle(
//           //     color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
//           getTitles: (value) {
//             // if(value.toInt() == 0) return '';
//             // else
//               return value.toInt().toString();
//           },
//         ),
//       ),
//       borderData:
//       FlBorderData(border: Border.all(color: Colors.white, width: 0.5)),//GainGermsTheme().getTheme().backGroundColor
//       alignment: BarChartAlignment.spaceAround,
//       maxY: 16,
//       barGroups: barChartGroupData,
//     ));
//   }
// }
