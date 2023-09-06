import 'package:flutter/material.dart';

import '../Models/commonmodel.dart';




class PreLoaderScreen extends StatefulWidget {
  final Widget child;

  const PreLoaderScreen({
    required this.child,
  });

  @override
  preloaderScreenState createState() {
    return preloaderScreenState();
  }
}

class preloaderScreenState extends State<PreLoaderScreen>
    with TickerProviderStateMixin {
  preloaderScreenState();

  // late Image imgPageOne;
  //
  // bool isNationalDay = false; //Utility().isNationalDay();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // precacheImage(imgPageOne.image, context);
  }

  void errorClickHandling() {
    // exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isNationalDay(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return  Container();
        });

  }

  Future<bool> isNationalDay() async {
    var now = DateTime.now().toUtc();
    String convertedDateTime =
        "${now.year.toString()}/${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')}";
    List<String> d2 =
    await getListFromLocal("SPECIAL_DAYS"); //[DateTime.utc(2021,12,18)];
    for (var i = 0; i < d2.length; i++) {
      if (d2[i].compareTo(convertedDateTime) == 0) return true;
    }
    return false;
  }
}