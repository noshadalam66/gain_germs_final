import '../Theme/theme.dart';
import '../constants/app_constant.dart';
import '../controllers/MyMenuController.dart';
import '../screens/roll/roll_screen.dart';
import '../util/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../helper/shared_preferences.dart';
import '../routes/route_delegate.dart';
import '../routes/route_handeler.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  SideMenuState createState() { return SideMenuState();}

}
class SideMenuState extends State<SideMenu> {

  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<MyMenuController>(context);
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/only_g.png"),
          ),
          ListTile(
            horizontalTitleGap: 0.0,
            leading: Image.asset(
              "assets/images/dashboard.png",
              height: 22,
            ),
            title: Text(
              "Dashboard",
              style: TextStyle(color: Colors.white54),
            ),
            tileColor: AppConstant.selectedIndex == 0 ? GainGermsTheme().getTheme().buttonColor : null,
            onTap: () {
              // Navigator.of(context).pop();
              navigation.updateNavigation("dashboard");
              // Navigator.of(context).pushReplacement(MaterialPageRoute(
              //     builder: (BuildContext context) => RollScreen()));
              // setState(() {
                AppConstant.selectedIndex = 0;
              navigation.closeMenu();
              // });
            },
          ),
          ListTile(
            horizontalTitleGap: 0.0,
            leading: Image.asset(
              "assets/images/roll.png",
              height: 22,
            ),
            title: Text(
              "Roll",
              style: TextStyle(color: Colors.white54),
            ),
            tileColor: AppConstant.selectedIndex == 1 ? GainGermsTheme().getTheme().buttonColor : null,
            onTap: () {
              navigation.updateNavigation("roll");
                AppConstant.selectedIndex = 1;
              navigation.closeMenu();
            },
          ),
          ListTile(
            horizontalTitleGap: 0.0,
            leading: Image.asset(
              "assets/images/deposit.png",
              height: 22,
            ),
            title: Text(
              "Deposits",
              style: TextStyle(color: Colors.white54),
            ),
            tileColor: AppConstant.selectedIndex == 2 ? GainGermsTheme().getTheme().buttonColor : null,
            onTap: () {
              navigation.updateNavigation("deposits");
              AppConstant.selectedIndex = 2;
              navigation.closeMenu();
              // setState(() {
              //   AppConstant.selectedIndex = 2;
              // });
            },
          ),
          ListTile(
            horizontalTitleGap: 0.0,
            leading: Image.asset(
              "assets/images/withdrawal.png",
              height: 22,
            ),
            title: Text(
              "Withdrawal",
              style: TextStyle(color: Colors.white54),
            ),
            tileColor: AppConstant.selectedIndex == 3 ? GainGermsTheme().getTheme().buttonColor : null,
            onTap: () {
              navigation.updateNavigation("withdrawal");
              AppConstant.selectedIndex = 3;
              navigation.closeMenu();
              // setState(() {
              //   AppConstant.selectedIndex = 3;
              // });
            },
          ),
          ListTile(
            horizontalTitleGap: 0.0,
            leading: Image.asset(
              "assets/images/lottery.png",
              height: 22,
            ),
            title: Text(
              "Lottery",
              style: TextStyle(color: Colors.white54),
            ),
            tileColor: AppConstant.selectedIndex == 4 ? GainGermsTheme().getTheme().buttonColor : null,
            onTap: () {
              navigation.updateNavigation("lottery");
              AppConstant.selectedIndex =4;
              navigation.closeMenu();
              // setState(() {
              //   AppConstant.selectedIndex = 4;
              // });
            },
          ),
          ListTile(
            horizontalTitleGap: 0.0,
            leading: Image.asset(
              "assets/images/user_level.png",
              height: 22,
            ),
            title: Text(
              "User Level",
              style: TextStyle(color: Colors.white54),
            ),
            tileColor: AppConstant.selectedIndex == 5 ? GainGermsTheme().getTheme().buttonColor : null,
            onTap: () {
              navigation.updateNavigation("user_level");
              AppConstant.selectedIndex = 5;
              navigation.closeMenu();
              // setState(() {
              //   AppConstant.selectedIndex = 5;
              // });
            },
          ),
          ListTile(
            horizontalTitleGap: 0.0,
            leading: Image.asset(
              "assets/images/referrals.png",
              height: 22,
            ),
            title: Text(
              "Referrals",
              style: TextStyle(color: Colors.white54),
            ),
            tileColor: AppConstant.selectedIndex == 6 ? GainGermsTheme().getTheme().buttonColor : null,
            onTap: () {
              navigation.updateNavigation("referrals");
              AppConstant.selectedIndex = 6;
              navigation.closeMenu();
              // setState(() {
              //   AppConstant.selectedIndex = 6;
              // });
            },
          ),
          ListTile(
            horizontalTitleGap: 0.0,
            leading: Image.asset(
              "assets/images/smart_contract.png",
              height: 22,
            ),
            title: Text(
              "Smart Contract",
              style: TextStyle(color: Colors.white54),
            ),
            tileColor: AppConstant.selectedIndex == 7 ? GainGermsTheme().getTheme().buttonColor : null,
            onTap: () {
              navigation.updateNavigation("smart_contract");
              AppConstant.selectedIndex = 7;
              navigation.closeMenu();
              // setState(() {
              //   AppConstant.selectedIndex = 7;
              // });
            },
          ),
          ListTile(
            horizontalTitleGap: 0.0,
            leading: Image.asset(
              "assets/images/faq.png",
              height: 22,
            ),
            title: Text(
              "FAQ",
              style: TextStyle(color: Colors.white54),
            ),
            tileColor: AppConstant.selectedIndex == 8 ? GainGermsTheme().getTheme().buttonColor : null,
            onTap: () {
              navigation.updateNavigation("faq");
              AppConstant.selectedIndex = 8;
              navigation.closeMenu();
              // setState(() {
              //   AppConstant.selectedIndex = 8;
              // });
            },
          ),
          ListTile(
            horizontalTitleGap: 0.0,
            leading: Image.asset(
              "assets/images/logout.png",
              height: 22,
            ),
            title: Text(
              "Logout",
              style: TextStyle(color: Colors.white54),
            ),
            tileColor: AppConstant.selectedIndex == 9 ? GainGermsTheme().getTheme().buttonColor : null,
            onTap: () {
              invitedby = "";
              path = "";
              addBoolToSF(isLoggedIn, false);
              navigation.closeMenu();
              AppRouterDelegate().setPathName(RouteData.login.name, loggedIn: false);
            },
          ),
        ],
      ),
    );
  }
}

// class DrawerListTile extends StatelessWidget {
//   const DrawerListTile({
//     Key? key,
//     // For selecting those three line once press "Command+D"
//     required this.title,
//     required this.svgSrc,
//     required this.press,
//   }) : super(key: key);
//
//   final String title, svgSrc;
//   final VoidCallback press;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: press,
//       horizontalTitleGap: 0.0,
//       leading: SvgPicture.asset(
//         svgSrc,
//         color: Colors.white54,
//         height: 16,
//       ),
//       title: Text(
//         title,
//         style: TextStyle(color: Colors.white54),
//       ),
//     );
//   }
// }
