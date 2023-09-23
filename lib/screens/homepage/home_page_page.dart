import 'package:flutter/material.dart';
import 'package:gain_germs_final/Theme/theme.dart';
import '../../responsive.dart';
import '../../routes/route_delegate.dart';
import '../../routes/route_handeler.dart';
import 'index.dart';

class HomePagePage extends StatefulWidget {
  static const String routeName = '/homePage';


  @override
  _HomePagePageState createState() => _HomePagePageState();
}

class _HomePagePageState extends State<HomePagePage> {
  final _HomePageBloc = HomePageBloc(UnHomePageState());
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GainGermsTheme().getTheme().white,
      body: HomePageScreen(
          HomePageBloc: _HomePageBloc),
      appBar: Responsive.isDesktop(context) ? null : AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
            color: Colors.black
        ),
        title: const Text(''),
      ),

      drawer: Responsive.isDesktop(context) ? null : Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: GainGermsTheme().getTheme().backGroundColor,
              ),
              child: Image.asset(
                "assets/images/g.png",
                fit: BoxFit.contain,
              ),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
                AppRouterDelegate().setPathName(RouteData.homePage.name);
              },
            ),
            ListTile(
              title: const Text('ABOUT US'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
                AppRouterDelegate().setPathName(RouteData.homePage.name);
              },
            ),
            ListTile(
              title: const Text('CONTACT US'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
                AppRouterDelegate().setPathName(RouteData.homePage.name);
              },
            ),
            ListTile(
              title: const Text('PRIVACY POLICY'),
              selected: _selectedIndex == 3,
              onTap: () {
                // Update the state of the app
                _onItemTapped(3);
                // Then close the drawer
                Navigator.pop(context);
                AppRouterDelegate().setPathName(RouteData.privacy_policy.name);
              },
            ),
            ListTile(
              title: const Text('TERM & CONDITION'),
              selected: _selectedIndex == 4,
              onTap: () {
                // Update the state of the app
                _onItemTapped(4);
                // Then close the drawer
                Navigator.pop(context);
                AppRouterDelegate().setPathName(RouteData.term_and_condition.name);
              },
            ),
          ],
        ),
      ),
      endDrawerEnableOpenDragGesture: true,
    );
  }
}