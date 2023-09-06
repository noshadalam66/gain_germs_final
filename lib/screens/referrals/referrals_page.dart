import 'package:flutter/material.dart';
import 'index.dart';

class ReferralsPage extends StatefulWidget {
  static const String routeName = '/Referrals';


  @override
  _ReferralsPageState createState() => _ReferralsPageState();
}

class _ReferralsPageState extends State<ReferralsPage> {
  final _ReferralsBloc = ReferralsBloc(UnReferralsState());

  @override
  Widget build(BuildContext context) {
    dynamic dynamicValue = ModalRoute.of(context)!.settings.arguments ;
    return Scaffold(
      // backgroundColor: QIBTheme().getTheme().white,
      body: Stack(
        children: [
          ReferralScreen(
              referralsBloc: _ReferralsBloc),
          // Utility.getInstance()!.getStatusBarHeader()
        ],
      ),
    );
  }
}