import 'package:flutter/material.dart';
import 'index.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = '/Dashboard';


  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _DashboardBloc = DashboardBloc(UnDashboardState());

  @override
  Widget build(BuildContext context) {
    dynamic dynamicValue = ModalRoute.of(context)!.settings.arguments ;
    return Scaffold(
      // backgroundColor: QIBTheme().getTheme().white,
      body: Stack(
        children: [
          DashboardScreen(
              dashboardBloc: _DashboardBloc),
          // Utility.getInstance()!.getStatusBarHeader()
        ],
      ),
    );
  }
}