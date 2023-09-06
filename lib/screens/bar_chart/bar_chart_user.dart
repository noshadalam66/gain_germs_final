import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../Models/user_details.dart';
import 'bar_chart_constants.dart';

class BarChartUsers extends StatelessWidget {
  const BarChartUsers({Key? key, required List<Referrals> referrals,})
      : _referrals = referrals, super(key: key);

  final List<Referrals> _referrals;
  @override
  Widget build(BuildContext context) {
    var _styleType = Theme.of(context).textTheme.bodyText1?.copyWith(color: lightTextColor);

    return BarChart(BarChartData(
        borderData: FlBorderData(border: Border.all(width: 0)),
        groupsSpace: 15,
        titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
                showTitles: true,
                // getTextStyles: (value) => const TextStyle(
                //       color: lightTextColor,
                //       fontWeight: FontWeight.bold,
                //       fontSize: 12,
                //     ),
                margin: appPadding,
                //X axis values
                getTitles: (double value) {
                  if (value == 1) {
                    return '1st';
                  } if (value == 2) {
                    return '2nd';
                  }if (value == 3) {
                    return '3rd';
                  } if (value == 4) {
                    return '4th';
                  }if (value == 5) {
                    return '5th';
                  }if (value == 6) {
                    return '6th';
                  }if (value == 7) {
                    return '7th';
                  }if (value == 8) {
                    return '8th';
                  }if (value == 9) {
                    return '9th';
                  }if (value == 10) {
                    return '10th+';
                  }else {
                    return '';
                  }
                }),
            leftTitles: SideTitles(
                showTitles: true,
                // getTextStyles: (value) => const TextStyle(
                //   color: lightTextColor,
                //   fontWeight: FontWeight.bold,
                //   fontSize: 12,
                // ),
                margin: appPadding,
                //Y axis values
                getTitles: (double value) {
                  if (value == 0) {
                    return '0';
                  } if (value == 3) {
                    return '3';
                  } if (value == 6) {
                    return '6';
                  }if (value == 9) {
                    return '9';
                  }if (value == 12) {
                    return '12+';
                  }else {
                    return '';
                  }
                })
        ),
        barGroups: [
          BarChartGroupData(x: 0, barRods: [
            BarChartRodData(
                y: 15,
                width: 0,
                colors: [primaryColorr],
                borderRadius: BorderRadius.circular(5)
            )
          ]),

          BarChartGroupData(x: 1, barRods: [
            BarChartRodData(
                y: _referrals.length >= 1 ? double.parse(_referrals.elementAt(0).userLevel ?? "0") : 0.5,
                width: 15,
                colors: [primaryColorr],
                borderRadius: BorderRadius.circular(5)
            )
          ]),
          
          BarChartGroupData(x: 2, barRods: [
            BarChartRodData(
                y: _referrals.length >= 2 ? double.parse(_referrals.elementAt(1).userLevel ?? "0") : 0.5,
                width: 15,
                colors: [lightTextColor],//_referrals.length >= 2 ? _referrals.elementAt(1).lastLogin
                borderRadius: BorderRadius.circular(5)
            )
          ]),

          
          BarChartGroupData(x: 3, barRods: [
            BarChartRodData(
                y: _referrals.length >= 3 ? double.parse(_referrals.elementAt(2).userLevel ?? "0") : 0.5,
                width: 15,
                colors: [primaryColorr],
                borderRadius: BorderRadius.circular(5)
            )
          ]),

          
          BarChartGroupData(x: 4, barRods: [
            BarChartRodData(
                y: _referrals.length >= 4 ? double.parse(_referrals.elementAt(3).userLevel ?? "0") : 0.5,
                width: 15,
                colors: [primaryColorr],
                borderRadius: BorderRadius.circular(5)
            )
          ]),

          BarChartGroupData(x: 5, barRods: [
            BarChartRodData(
                y: _referrals.length >= 5 ? double.parse(_referrals.elementAt(4).userLevel ?? "0") : 0.5,
                width: 15,
                colors: [primaryColorr],
                borderRadius: BorderRadius.circular(5)
            )
          ]),


          BarChartGroupData(x: 6, barRods: [
            BarChartRodData(
                y: _referrals.length >= 6 ? double.parse(_referrals.elementAt(5).userLevel ?? "0") : 0.5,
                width: 15,
                colors: [primaryColorr],
                borderRadius: BorderRadius.circular(5)
            )
          ]),


          BarChartGroupData(x: 7, barRods: [
            BarChartRodData(
                y: _referrals.length >= 7 ? double.parse(_referrals.elementAt(6).userLevel ?? "0") : 0.5,
                width: 15,
                colors: [primaryColorr],
                borderRadius: BorderRadius.circular(5)
            )
          ]),


          BarChartGroupData(x: 8, barRods: [
            BarChartRodData(
                y: _referrals.length >= 8 ? double.parse(_referrals.elementAt(7).userLevel ?? "0") : 0.5,
                width: 15,
                colors: [primaryColorr],
                borderRadius: BorderRadius.circular(5)
            )
          ]),


          BarChartGroupData(x: 9, barRods: [
            BarChartRodData(
                y: _referrals.length >= 9 ? double.parse(_referrals.elementAt(8).userLevel ?? "0") : 0.5,
                width: 15,
                colors: [primaryColorr],
                borderRadius: BorderRadius.circular(5)
            )
          ]),


          BarChartGroupData(x: 10, barRods: [
            BarChartRodData(
                y: _referrals.length >= 10 ? double.parse(_referrals.elementAt(9).userLevel ?? "0") : 0.5,
                width: 15,
                colors: [primaryColorr],
                borderRadius: BorderRadius.circular(5)
            )
          ]),



        ]));
  }
}