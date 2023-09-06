import 'package:flutter/material.dart';
import 'index.dart';

class UserLevelPage extends StatefulWidget {
  static const String routeName = '/UserLevel';


  @override
  _UserLevelPageState createState() => _UserLevelPageState();
}

class _UserLevelPageState extends State<UserLevelPage> {
  final _UserLevelBloc = UserLevelBloc(UnUserLevelState());

  @override
  Widget build(BuildContext context) {
    dynamic dynamicValue = ModalRoute.of(context)!.settings.arguments ;
    return Scaffold(
      // backgroundColor: QIBTheme().getTheme().white,
      body: Stack(
        children: [
          UserLevelScreen(
              userLevelBloc: _UserLevelBloc),
          // Utility.getInstance()!.getStatusBarHeader()
        ],
      ),
    );
  }
}