import 'package:flutter/material.dart';
import 'index.dart';

class SmartContractPage extends StatefulWidget {
  static const String routeName = '/SmartContract';


  @override
  _SmartContractPageState createState() => _SmartContractPageState();
}

class _SmartContractPageState extends State<SmartContractPage> {
  final _SmartContractBloc = SmartContractBloc(UnSmartContractState());

  @override
  Widget build(BuildContext context) {
    dynamic dynamicValue = ModalRoute.of(context)!.settings.arguments ;
    return Scaffold(
      // backgroundColor: QIBTheme().getTheme().white,
      body: Stack(
        children: [
          SmartContractScreen(
              smartContractBloc: _SmartContractBloc),
          // Utility.getInstance()!.getStatusBarHeader()
        ],
      ),
    );
  }
}