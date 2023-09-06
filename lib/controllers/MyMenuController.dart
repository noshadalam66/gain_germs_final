import 'package:flutter/material.dart';
import '../routes/route_delegate.dart';
import '../routes/route_handeler.dart';
import '../screens/dashboard/dashboard_page.dart';
import '../screens/deposit/deposit_page.dart';
import '../screens/faq/faq_page.dart';
import '../screens/lottery/lottery_page.dart';
import '../screens/referrals/referrals_page.dart';
import '../screens/roll/roll_page.dart';
import '../screens/smart_contract/smart_contract_page.dart';
import '../screens/user_level/user_level_page.dart';
import '../screens/withdraw/withdraw_page.dart';

class MyMenuController extends ChangeNotifier {
  String currentNavigation = "dashboard";
  Widget get getNavigation {
    if (currentNavigation == "dashboard") {
      AppRouterDelegate().setPathName(RouteData.dashboard.name, loggedIn: true);
      return DashboardPage();
    } else if (currentNavigation == "roll") {
      AppRouterDelegate().setPathName(RouteData.roll.name, loggedIn: true);
      return RollPage();
    } else if (currentNavigation == "deposits") {
      AppRouterDelegate().setPathName(RouteData.deposit.name, loggedIn: true);
      return DepositPage();
    } else if (currentNavigation == "withdrawal") {
      AppRouterDelegate().setPathName(RouteData.withdraw.name, loggedIn: true);
      return WithdrawPage();
    } else if (currentNavigation == "lottery") {
      AppRouterDelegate().setPathName(RouteData.lottery.name, loggedIn: true);
      return LotteryPage();
    } else if (currentNavigation == "user_level") {
      AppRouterDelegate().setPathName(RouteData.user_level.name, loggedIn: true);
      return UserLevelPage();
    } else if (currentNavigation == "referrals") {
      AppRouterDelegate().setPathName(RouteData.referrals.name, loggedIn: true);
      return ReferralsPage();
    } else if (currentNavigation == "smart_contract") {
      AppRouterDelegate().setPathName(RouteData.smart_contract.name, loggedIn: true);
      return SmartContractPage();
    } else if (currentNavigation == "faq") {
      AppRouterDelegate().setPathName(RouteData.faq.name, loggedIn: true);
      return FaqPage();
    }
    // else if (currentNavigation == "logout") {
    //   addBoolToSF(isLoggedIn, false);
    //   return
    //   Navigator.pushNamed(myContext!, MyRoutes.registerRoute);
    // }
    else {
      return DashboardPage();
    }
  }

  void updateNavigation(String navigation) {
    currentNavigation = navigation;
    notifyListeners();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void closeMenu() {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.closeDrawer();
    }
  }
}
