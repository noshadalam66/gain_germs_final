import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gain_germs_final/routes/route_delegate.dart';
import 'package:gain_germs_final/routes/route_information_parser.dart';
import '../constants/constants.dart';
class App extends StatelessWidget {
  final bool isLoggedIn;
  const App({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'GainGerms',
      routeInformationParser: RoutesInformationParser(),
      routerDelegate: AppRouterDelegate(isLoggedIn: isLoggedIn),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: Theme.of(context).textTheme
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
    );
  }
}
