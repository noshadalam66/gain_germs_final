import 'package:flutter/material.dart';
import 'package:gain_germs_final/Theme/theme.dart';
import 'index.dart';

class HomePagePage extends StatefulWidget {
  static const String routeName = '/HomePage';


  @override
  _HomePagePageState createState() => _HomePagePageState();
}

class _HomePagePageState extends State<HomePagePage> {
  final _HomePageBloc = HomePageBloc(UnHomePageState());

  @override
  Widget build(BuildContext context) {
    dynamic dynamicValue = ModalRoute.of(context)!.settings.arguments ;
    return Scaffold(
      backgroundColor: GainGermsTheme().getTheme().backGroundColor,
      body: Stack(
        children: [
          HomePageScreen(
              HomePageBloc: _HomePageBloc),
          // Utility.getInstance()!.getStatusBarHeader()
        ],
      ),
    );
  }
}