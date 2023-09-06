import 'package:flutter/material.dart';
import 'package:gain_germs_final/routes/route_handeler.dart';
import 'package:gain_germs_final/routes/route_path.dart';

import '../helper/shared_preferences.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/privacy_policy.dart';
import '../screens/term_and_condition.dart';
import 'custom_navigation_key.dart';
import 'custom_transition_delegate.dart';

/// AppRouterDelegate includes the parsed result from RoutesInformationParser
class AppRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  static final AppRouterDelegate _instance = AppRouterDelegate._();
  bool? isLoggedIn;
  String? pathName;
  bool isError = false;

  factory AppRouterDelegate({bool? isLoggedIn}) {
    _instance.isLoggedIn = isLoggedIn;
    return _instance;
  }
  AppRouterDelegate._();

  // A custom trasition delegate to overwrite the default animation.
  TransitionDelegate transitionDelegate = CustomTransitionDelegate();

  /// Keeps the app stack
  late List<Page> _stack = [];

  /// currentConfiguration detects a route information may have changed as a result of rebuild.
  @override
  RoutePath get currentConfiguration {
    if (isError) {
      return RoutePath.unknown();
    }
    if (pathName == null) return RoutePath.home('splash'); //main

    return RoutePath.otherPage(pathName);
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey =>
      CustomNavigationKeys.navigatorKey;

  /// App Stack - Profile screen and other known and unknown routes
  List<Page> get _appStack => [
        MaterialPage(
          key: const ValueKey('home'),
          child: HomeScreen(
            // routeName: pathName ?? RouteData.home.name,
          ),
        )
      ];

  /// Auth route
  List<Page> get _authStackLogin => [
    MaterialPage(
      key: const ValueKey('login'),
      child: LoginScreen(),
    ),
  ];

  List<Page> get _authStackRegister => [
    MaterialPage(
      key: const ValueKey('register'),
      child: RegisterScreen(),
    ),
  ];

  List<Page> get _authStackTNC => [
    MaterialPage(
      key: const ValueKey('term_and_condition'),
      child: TermAndCondition(),
    ),
  ];

  List<Page> get _authStackPP => [
    MaterialPage(
      key: const ValueKey('privacy_policy'),
      child: PrivacyPolicy(),
    ),
  ];

  /// UnKnownRoute Stack
  List<Page> get _unknownRoute => [
        const MaterialPage(
          key: ValueKey('unknown'),
          child: HomeScreen(),
        )
      ];

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn == true && pathName != null) {
      if(pathName != RouteData.dashboard.name &&
          pathName != RouteData.roll.name &&
          pathName != RouteData.deposit.name &&
          pathName != RouteData.withdraw.name &&
          pathName != RouteData.lottery.name &&
          pathName != RouteData.user_level.name &&
          pathName != RouteData.referrals.name &&
          pathName != RouteData.smart_contract.name &&
          pathName != RouteData.faq.name){
        _stack = _appStack;
      }
    } else if (isLoggedIn == true) {
      _stack = _appStack;
    } else if (isLoggedIn == false && pathName != null){
      if (pathName.toString().contains("register?invitedby=")) {
        _stack = _authStackRegister;
      }else if (pathName == RouteData.login.name) {
        _stack = _authStackLogin;
      }else if (pathName == RouteData.register.name) {
        _stack = _authStackRegister;
      }else if (pathName == RouteData.term_and_condition.name) {
        _stack = _authStackTNC;
      }else if (pathName == RouteData.privacy_policy.name) {
        _stack = _authStackPP;
      }
    } else {
      _stack = _authStackLogin;
      // _stack = _unknownRoute;
    }

    return Navigator(
      transitionDelegate: transitionDelegate,
      key: navigatorKey,
      pages: _stack,
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        pathName = null;
        // isError = false;
        notifyListeners();
        return true;
      },
    );
  }

  /// setNewRoutePath is called when a new route has been pushed to the application.
  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {
    bool isLoggedIn = await getBoolValuesSF("isLoggedIn");

    pathName = configuration.pathName;

    if (configuration.isOtherPage) {
      if (configuration.pathName != null) {
        if (isLoggedIn == true) {
          /// If logged in
          if (configuration.pathName == RouteData.splash.name) {
            pathName = RouteData.splash.name;
            isError = false;
          } else if (configuration.pathName == RouteData.dashboard.name) {
            pathName = RouteData.dashboard.name;
            isError = false;
          } else if (configuration.pathName == RouteData.term_and_condition.name) {
            pathName = RouteData.term_and_condition.name;
            isError = false;
          } else if (configuration.pathName == RouteData.privacy_policy.name) {
            pathName = RouteData.privacy_policy.name;
            isError = false;
          } else if (configuration.pathName == RouteData.home.name) {
            pathName = RouteData.home.name;
            isError = false;
          } else if (configuration.pathName == RouteData.faq.name) {
            pathName = RouteData.faq.name;
            isError = false;
          } else if (configuration.pathName == RouteData.lottery.name) {
            pathName = RouteData.lottery.name;
            isError = false;
          } else if (configuration.pathName == RouteData.referrals.name) {
            pathName = RouteData.referrals.name;
            isError = false;
          } else if (configuration.pathName == RouteData.roll.name) {
            pathName = RouteData.roll.name;
            isError = false;
          } else if (configuration.pathName == RouteData.smart_contract.name) {
            pathName = RouteData.smart_contract.name;
            isError = false;
          } else if (configuration.pathName == RouteData.user_level.name) {
            pathName = RouteData.user_level.name;
            isError = false;
          } else if (configuration.pathName == RouteData.withdraw.name) {
            pathName = RouteData.withdraw.name;
            isError = false;
          } else if (configuration.pathName == RouteData.deposit.name) {
            pathName = RouteData.deposit.name;
            isError = false;
          } else {
            pathName = RouteData.home.name;
            isError = false;
          }
        } else {
          if (configuration.pathName == RouteData.login.name) {
            pathName = RouteData.login.name;
            isError = false;
          } else if (configuration.pathName == RouteData.register.name) {
            pathName = RouteData.register.name;
            isError = false;
          } else if (configuration.pathName == RouteData.term_and_condition.name) {
            pathName = RouteData.term_and_condition.name;
            isError = false;
          } else if (configuration.pathName == RouteData.privacy_policy.name) {
            pathName = RouteData.privacy_policy.name;
            isError = false;//register?invitedby=NOSHADALAM9129672
          } else if (configuration.pathName.toString().contains("register?invitedby=")) {
            pathName = configuration.pathName;//RouteData.register.name;
            isError = false;
          } else{
            pathName = RouteData.login.name;
            isError = false;
          }
        }
      } else {
        pathName = configuration.pathName;
        isError = false;
      }
    } else {
      pathName = "/";
    }
    notifyListeners();
  }

  /// setPathName  sets url path
  void setPathName(String path, {bool loggedIn = false}) {
    pathName = path;
    isLoggedIn = loggedIn;
    setNewRoutePath(RoutePath.otherPage(pathName));
    notifyListeners();
  }
}
