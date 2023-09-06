import 'package:flutter/material.dart';
import 'index.dart';

class WithdrawPage extends StatefulWidget {
  static const String routeName = '/Withdraw';


  @override
  _WithdrawPageState createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  final _WithdrawBloc = WithdrawBloc(UnWithdrawState());

  @override
  Widget build(BuildContext context) {
    dynamic dynamicValue = ModalRoute.of(context)!.settings.arguments ;
    return Scaffold(
      // backgroundColor: QIBTheme().getTheme().white,
      body: Stack(
        children: [
          WithdrawalScreen(
              withdrawBloc: _WithdrawBloc),
          // Utility.getInstance()!.getStatusBarHeader()
        ],
      ),
    );
  }
}