import 'package:flutter/material.dart';
import 'deposit_screen.dart';
import 'index.dart';

class DepositPage extends StatefulWidget {
  static const String routeName = '/Deposit';


  @override
  _DepositPageState createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  final _DepositBloc = DepositBloc(UnDepositState());

  @override
  Widget build(BuildContext context) {
    dynamic dynamicValue = ModalRoute.of(context)!.settings.arguments ;
    return Scaffold(
      // backgroundColor: QIBTheme().getTheme().white,
      body: Stack(
        children: [
          DepositScreen(
              depositBloc: _DepositBloc),
          // Utility.getInstance()!.getStatusBarHeader()
        ],
      ),
    );
  }
}