import 'package:flutter/material.dart';
import 'index.dart';

class RollPage extends StatefulWidget {
  static const String routeName = '/Roll';


  @override
  _RollPageState createState() => _RollPageState();
}

class _RollPageState extends State<RollPage> {
  final _RollBloc = RollBloc(UnRollState());

  @override
  Widget build(BuildContext context) {
    dynamic dynamicValue = ModalRoute.of(context)!.settings.arguments ;
    return Scaffold(
      // backgroundColor: QIBTheme().getTheme().white,
      body: Stack(
        children: [
          RollScreen(
              rollBloc: _RollBloc),
          // Utility.getInstance()!.getStatusBarHeader()
        ],
      ),
    );
  }
}