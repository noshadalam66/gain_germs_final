// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class ChartContainer extends StatelessWidget {
//   final Widget chart;
//
//   const ChartContainer({
//     Key? key,
//     required this.chart,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     // _size.width > 1000 showing 2 column else 1 column
//     return Center(
//       child: Container(
//         // width: size.width * 0.95,
//         height: size.width > 1300 ? MediaQuery.of(context).size.width * 0.21 :
//         size.width > 1200 ? MediaQuery.of(context).size.width * 0.25 :
//         size.width > 1100 ? MediaQuery.of(context).size.width * 0.27 :
//         size.width > 1000 ? MediaQuery.of(context).size.width * 0.32 :
//         size.width > 900 ? MediaQuery.of(context).size.width * 0.35 :
//         size.width > 800 ? MediaQuery.of(context).size.width * 0.39 :
//         size.width > 700 ? MediaQuery.of(context).size.width * 0.44 :
//         MediaQuery.of(context).size.width * 0.52 ,//* 0.95 * 0.65,
//         padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
//         // decoration: BoxDecoration(
//         //   color: color,
//         //   borderRadius: BorderRadius.circular(20),
//         // ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // Text(
//             //   title,
//             //   style: TextStyle(
//             //       color: Colors.white,
//             //       fontSize: 16,
//             //       fontWeight: FontWeight.bold),
//             // ),
//             Expanded(
//                 child: Container(
//               // padding: EdgeInsets.only(top: 10),
//               child: chart,
//             ))
//           ],
//         ),
//       ),
//     );
//   }
// }