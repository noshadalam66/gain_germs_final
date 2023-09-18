import 'package:gain_germs_final/screens/homepage/widgets/pages_header.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../routes/route_delegate.dart';
import '../../routes/route_handeler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helper/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import 'index.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controllers/simple_ui_controller.dart';

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

  bool isApiCall = false;
  bool showData = false;
  List activityTimeline = [];

  @override
  initState() {
    super.initState();

    getBoolValuesSF(isLoggedIn).then((value) => {
      if (!value){AppRouterDelegate().setPathName(RouteData.login.name, loggedIn: false)}
    });

  }

  SimpleUIController simpleUIController = Get.put(SimpleUIController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                  HomePagesHeader(),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 600) {
                        return _buildLargeScreen(context, size, simpleUIController);
                      } else {
                        return _buildSmallScreen(context, size, simpleUIController);
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  /// For large screens
  Widget _buildLargeScreen(
      BuildContext context,
      Size size,
      SimpleUIController simpleUIController,
      ) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: _buildMainBody(
            context,
            size,
            simpleUIController,
          ),
        ),
        SizedBox(width: size.width * 0.06),
        Expanded(
          flex: 3,
          child: Lottie.asset(
            'assets/coin.json',
            height: size.height * 0.3,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }

  /// For Small screens
  Widget _buildSmallScreen(
      BuildContext context,
      Size size,
      SimpleUIController simpleUIController,
      ) {
    return Center(
      child: _buildMainBody(
        context,
        size,
        simpleUIController,
      ),
    );
  }

  /// Main Body
  Widget _buildMainBody(
      BuildContext context,
      Size size,
      SimpleUIController simpleUIController,
      ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: size.width > 600
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          size.width > 600
              ? Container()
              : Lottie.asset(
            'assets/wave.json',
            height: size.height * 0.2,
            width: size.width,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Login',
              style: kLoginTitleStyle(size, Colors.white),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Welcome Back',
              style: kLoginSubtitleStyle(size, Colors.white),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
        ],
      ),
    );
  }

}

