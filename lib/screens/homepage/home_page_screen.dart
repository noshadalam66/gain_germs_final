import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../routes/route_delegate.dart';
import '../../routes/route_handeler.dart';
import '../../Models/user_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Models/commonmodel.dart';
import '../../helper/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../header/header.dart';
import 'index.dart';

class HomePageScreen extends StatefulWidget {

  const HomePageScreen({
    Key? key,
    required HomePageBloc HomePageBloc,
  })  : _HomePageBloc = HomePageBloc,
        super(key: key);


  final HomePageBloc _HomePageBloc;

  @override
  HomePageScreenState createState() {
    return HomePageScreenState();
  }
}


class HomePageScreenState extends State<HomePageScreen> {

  UserResponse? userResponse;
  bool isApiCall = true;
  bool showData = false;
  List activityTimeline = [];

  @override
  initState() {
    super.initState();
    _load();

    getBoolValuesSF(isLoggedIn).then((value) => {
      if (!value){AppRouterDelegate().setPathName(RouteData.login.name, loggedIn: false)}
    });
    // html.window.history.pushState({}, '', '/user-level');

  }

  void _load(){
    widget._HomePageBloc.add(LoadHomePageEvent());
  }

  void setValue(UserResponse ur, bool sd){
    setUserDetail(ur);
    userResponse = ur;
    isApiCall = false;
    showData = sd;

    int limit = userResponse?.customerData?.activityTimeline?.length ?? 0;
    for (int i = 0; i < limit; i++) {
      if (i > 5) break;
      activityTimeline.add(userResponse?.customerData?.activityTimeline![i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return BlocConsumer<HomePageBloc, HomePageState>(
        bloc: widget._HomePageBloc,
        listener: (BuildContext context,
            HomePageState currentState,) {
          if (currentState is UnHomePageState) {
            isApiCall = true;
          }
          if (currentState is ErrorHomePageState) {
            isApiCall = false;
            // errorHandling(currentState.errorMessage);
          }
          if (currentState is InHomePageState) {
            isApiCall = false;
          }
        },
        builder: (BuildContext context,
            HomePageState currentState,) {
          return ModalProgressHUD(
            opacity: 0.3,
            color: Colors.grey,
            progressIndicator: CircularProgressIndicator(),
            dismissible: false,
            inAsyncCall: isApiCall,
            child: SingleChildScrollView(
              primary: false,
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  Header(userResponse: userResponse),

                ],
              ),
            ),
          );
        });
  }
}

