import 'package:flutter/material.dart';
import 'index.dart';

class FaqPage extends StatefulWidget {
  static const String routeName = '/Faq';


  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final _FaqBloc = FaqBloc(UnFaqState());

  @override
  Widget build(BuildContext context) {
    dynamic dynamicValue = ModalRoute.of(context)!.settings.arguments ;
    return Scaffold(
      // backgroundColor: QIBTheme().getTheme().white,
      body: Stack(
        children: [
          FAQScreen(
              faqBloc: _FaqBloc),
          // Utility.getInstance()!.getStatusBarHeader()
        ],
      ),
    );
  }
}