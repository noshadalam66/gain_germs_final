import 'package:flutter/material.dart';
import 'index.dart';

class LotteryPage extends StatefulWidget {
  static const String routeName = '/Lottery';


  @override
  _LotteryPageState createState() => _LotteryPageState();
}

class _LotteryPageState extends State<LotteryPage> {
  final _LotteryBloc = LotteryBloc(UnLotteryState());

  @override
  Widget build(BuildContext context) {
    dynamic dynamicValue = ModalRoute.of(context)!.settings.arguments ;
    return Scaffold(
      // backgroundColor: QIBTheme().getTheme().white,
      body: Stack(
        children: [
          LotteryScreen(
              lotteryBloc: _LotteryBloc),
          // Utility.getInstance()!.getStatusBarHeader()
        ],
      ),
    );
  }
}