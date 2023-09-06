import '../../Models/user_details.dart';
import '../../responsive.dart';
import '../../screens/dashboard/components/activity_timeline.dart';
import '../../screens/dashboard/components/third_four_layout.dart';
import '../../screens/dashboard/components/last_three_referrals.dart';
import '../../screens/dashboard/components/second_three_layout.dart';
import '../../screens/dashboard/components/first_four_layout.dart';
import '../../screens/dashboard/dashboard_bloc.dart';
import '../../screens/dashboard/dashboard_event.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../Models/commonmodel.dart';
import '../../header/header.dart';
import '../../helper/shared_preferences.dart';
import '../../routes/route_delegate.dart';
import '../../routes/route_handeler.dart';
import 'dashboard_state.dart';

class DashboardScreen extends StatefulWidget {

  const DashboardScreen({
    Key? key,
    required DashboardBloc dashboardBloc,
  })  : _dashboardBloc = dashboardBloc,
        super(key: key);


  final DashboardBloc _dashboardBloc;

  @override
  DashboardScreenState createState() {
    return DashboardScreenState();
  }
}

class DashboardScreenState extends State<DashboardScreen> {

  UserResponse? userResponse;
  bool isApiCall = true;
  bool showData = false;


  @override
  initState() {
    super.initState();
    getBoolValuesSF(isLoggedIn).then((value) => {
      if (!value){
        AppRouterDelegate().setPathName(RouteData.login.name, loggedIn: false)
      }
    });
    _load();
  }

  void _load(){
    widget._dashboardBloc.add(LoadDashboardEvent());
  }

  void setValue(UserResponse ur, bool sd){
    setUserDetail(ur);
    userResponse = ur;
    isApiCall = false;
    showData = sd;

    print("userResponse - ${userResponse}");
    String lastOnline = userResponse?.customerData?.lastOnline ?? "";
    DateTime lastOnlineDate = lastOnline == "" ? DateTime.now() : DateTime.parse(lastOnline);

    if(lastOnlineDate.day < DateTime.now().day){
      updateForLastOnline(userResponse).then((value){
        int ulp = int.parse(userResponse?.customerData?.userLevelPoints ?? "1");
        int levelAward = 0;
        if (ulp == 1) {
          levelAward = int.parse(userResponse?.customerData?.levelAward ?? "4");
        }
        widget._dashboardBloc.add(updateLastOnlineTimeToServer(
            int.parse(userResponse?.customerData?.userLevel ?? "1"),
            int.parse(userResponse?.customerData?.userLevelPoints ?? "1"),
            userResponse?.customerData?.id ?? "1", levelAward));
      });
      setState(() {
        isApiCall = true;
      });
    }else if(lastOnlineDate.year != DateTime.now().year || lastOnlineDate.month < DateTime.now().month){
      updateForLastOnline(userResponse).then((value){
        int ulp = int.parse(userResponse?.customerData?.userLevelPoints ?? "1");
        int levelAward = 0;
        if (ulp == 1) {
          levelAward = int.parse(userResponse?.customerData?.levelAward ?? "4");
        }
        widget._dashboardBloc.add(updateLastOnlineTimeToServer(
            int.parse(userResponse?.customerData?.userLevel ?? "1"),
            int.parse(userResponse?.customerData?.userLevelPoints ?? "1"),
            userResponse?.customerData?.id ?? "1", levelAward));
      });
      setState(() {
        isApiCall = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<DashboardBloc, DashboardState>(
        bloc: widget._dashboardBloc,
        listener: (BuildContext context,
            DashboardState currentState,) {
          if (currentState is UnDashboardState) {
            isApiCall = true;
          }
          if (currentState is ErrorDashboardState) {
            isApiCall = false;
            // errorHandling(currentState.errorMessage);
          }
          if (currentState is InDashboardState) {
            isApiCall = false;
          }
          if (currentState is ApiCardsCallBackForOnline) {
            userResponse = currentState.userResponse;
            if(userResponse?.customerData == null){
              getCDFromSF().then((value) => {
                setValue(value!, currentState.showData)
              });
            }else{
              isApiCall = false;
              showData = currentState.showData;
            }
          }
          if (currentState is ApiCardsCallBack) {
            userResponse = currentState.userResponse;
            if(userResponse?.customerData == null){
              getCDFromSF().then((value) => {
                setValue(value!, currentState.showData)
              });
            }else{
              isApiCall = false;
              showData = currentState.showData;

              print("userResponse - ${userResponse}");
              String lastOnline = userResponse?.customerData?.lastOnline ?? "";
              DateTime lastOnlineDate = lastOnline == "" ? DateTime.now() : DateTime.parse(lastOnline);

              if(lastOnlineDate.day < DateTime.now().day){
                updateForLastOnline(userResponse).then((value){
                  int ulp = int.parse(userResponse?.customerData?.userLevelPoints ?? "1");
                  int levelAward = 0;
                  if (ulp == 1) {
                    levelAward = int.parse(userResponse?.customerData?.levelAward ?? "4");
                  }
                  widget._dashboardBloc.add(updateLastOnlineTimeToServer(
                      int.parse(userResponse?.customerData?.userLevel ?? "1"),
                      int.parse(userResponse?.customerData?.userLevelPoints ?? "1"),
                      userResponse?.customerData?.id ?? "1", levelAward));
                });
                setState(() {
                  isApiCall = true;
                });
              }else if(lastOnlineDate.year != DateTime.now().year || lastOnlineDate.month < DateTime.now().month){
                updateForLastOnline(userResponse).then((value){
                  int ulp = int.parse(userResponse?.customerData?.userLevelPoints ?? "1");
                  int levelAward = 0;
                  if (ulp == 1) {
                    levelAward = int.parse(userResponse?.customerData?.levelAward ?? "4");
                  }
                  widget._dashboardBloc.add(updateLastOnlineTimeToServer(
                      int.parse(userResponse?.customerData?.userLevel ?? "1"),
                      int.parse(userResponse?.customerData?.userLevelPoints ?? "1"),
                      userResponse?.customerData?.id ?? "1", levelAward));
                });
                setState(() {
                  isApiCall = true;
                });
              }
            }
          }
        },
        builder: (BuildContext context,
            DashboardState currentState,) {
          return ModalProgressHUD(
            opacity: 0.3,
            color: Colors.grey,
            progressIndicator: CircularProgressIndicator(),
            dismissible: false,
            inAsyncCall: isApiCall,
            child: Column(children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(defaultPadding),
                  physics: ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      Header(userResponse: userResponse),
                      SizedBox(height: defaultPadding),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                FirstFourLayout(userResponse: userResponse),
                                SecondThreeLayout(userResponse: userResponse),
                                ThirdFourLayout(userResponse: userResponse),
                                SizedBox(height: defaultPadding),
                                ActivityTimeline(userResponse: userResponse),
                                SizedBox(height: defaultPadding),
                                LastThreeReferrals(
                                    userResponse: userResponse),
                                if (Responsive.isMobile(context))
                                  SizedBox(height: defaultPadding),
                                // if (Responsive.isMobile(context)) StarageDetails(),
                              ],
                            ),
                          ),
                          if (!Responsive.isMobile(context))
                            SizedBox(width: defaultPadding),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ]),
          );
        });
  }
}
