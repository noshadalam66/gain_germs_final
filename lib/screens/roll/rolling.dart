import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class Rolling extends StatefulWidget {
  const Rolling({Key? key}) : super(key: key);

  @override
  RollingState createState() {
    return RollingState();
  }
}

class RollingState extends State<Rolling> {
  Timer? countdownTimer;
  Duration myDuration = Duration(seconds: 3);
  bool timeDifference = false;

  /// Timer related methods ///
  // Step 3
  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(milliseconds: 30), (_) => setCountDown());
  }


  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  void resetTimer(int seconds) {
    stopTimer();
    setState(() => myDuration = Duration(seconds: seconds));
  }

  // Step 6
  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var rng = Random();
    int check = rng.nextInt(1000);
    return Text("${check}",
      style: Theme.of(context)
          .textTheme
          .headline4!
          .copyWith(color: Colors.white, fontWeight: FontWeight.bold),);
  }
}
