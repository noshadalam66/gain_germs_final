// import '../../Models/commonmodel.dart';
// import '../../Models/user_details.dart';
// import '../../screens/auth/login_screen.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
//
// import '../constants/constants.dart';
// import '../helper/shared_preferences.dart';
// import '../util/routes.dart';
//
// class SplashScreen extends StatefulWidget {
//   _SplashScreen createState() => _SplashScreen();
// }
//
// class _SplashScreen extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // checkLoggedIn();
//   }
//
//   // checkLoggedIn() async {
//   //   try {
//   //     getBoolValuesSF(isLoggedIn).then((value) {
//   //           if (value)
//   //             {
//   //               getCDFromSF().then((value) => {setUserDetailAndIntent(value!)});
//   //             }
//   //           else {
//   //             // if(invitedby == ""){
//   //               Navigator.pushReplacementNamed(context, MyRoutes.homePage);
//   //             // }else{
//   //             // }
//   //           }
//   //         });
//   //   } catch (Exception) {}
//   // }
//
//   setUserDetailAndIntent(UserResponse ur) {
//     ///setting obj to global variable
//     setUserDetail(ur);
//     Navigator.pushReplacementNamed(context, MyRoutes.homeRoute);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
