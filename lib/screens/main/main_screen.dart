import '../../Theme/theme.dart';
import '../../controllers/MyMenuController.dart';
import '../../responsive.dart';
import '../../screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../drawer/side_menu.dart';
import '../../constants/app_constant.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() { return MainScreenState();}
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return getDashboard(context);
  }

  Widget getDashboard(BuildContext context) {
    return Scaffold(
      backgroundColor: GainGermsTheme().getTheme().backGroundColor,
      key: context
          .read<MyMenuController>()
          .scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: Consumer<MyMenuController>(builder: (context, navigationProvider, _) =>
                  navigationProvider.getNavigation),
            ),
          ],
        ),
      ),
    );
  }
}
