import 'package:gain_germs_final/screens/homepage/widgets/pages_header.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../Theme/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../responsive.dart';
import '../../routes/route_delegate.dart';
import '../../routes/route_handeler.dart';
import 'index.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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
  bool isHoveringLogin = false;
  bool isHoveringRegister = false;
  bool isApiCall = false;
  bool showData = false;
  List activityTimeline = [];

  @override
  initState() {
    super.initState();


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
                  ///tab bar
                  Responsive.isDesktop(context) ? _tabBarLarge() : Container(),


                  /// 1st layout
                  SizedBox(height: size.height * 0.24),
                  if (Responsive.isDesktop(context))
                    _buildLargeScreen(context, size, simpleUIController),
                  if (Responsive.isTablet(context))
                    _buildLargeScreen(context, size, simpleUIController),
                  if (Responsive.isMobile(context))
                    _buildSmallScreen(context, size, simpleUIController),


                  ///2nd layout
                  if (Responsive.isDesktop(context) || Responsive.isTablet(context))
                    Container(
                      margin: EdgeInsets.only(left: size.width * 0.2),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          if (constraints.maxWidth > 600) {
                            return Image.asset(
                              "assets/images/circle_shape.png",
                              fit: BoxFit.contain,
                            );
                          } else {
                            return SizedBox(height: 60);
                          }
                        },
                      ),
                    ),

                  SizedBox(height: size.height * 0.14),

                  ///3rd layout
                  if (Responsive.isDesktop(context))
                    _buildLargeScreen2(context, size, simpleUIController),
                  if (Responsive.isTablet(context))
                    _buildLargeScreen2(context, size, simpleUIController),
                  if (Responsive.isMobile(context))
                    _buildSmallScreen2(context, size, simpleUIController),

                  SizedBox(height: size.height * 0.2),

                  Text(
                    'Features',
                    style: TextStyle(fontSize: 18, color: GainGermsTheme().getTheme().backGroundColor),
                  ),
                  Text(
                    'Some Of The Best Features',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: GainGermsTheme().getTheme().backGroundColor),
                  ),
                  SizedBox(height: size.height * 0.03),

                  ///4th layout
                  if (Responsive.isDesktop(context) || Responsive.isTablet(context))
                    Container(
                        margin: EdgeInsets.only(left: 50, right: 50),
                        child: _buildFeatureLargeScreen(context, size, simpleUIController)
                    ),
                  if (Responsive.isMobile(context))
                    Container(
                        margin: EdgeInsets.only(left: 50, right: 50),
                        child: _buildSmallFeatureScreen(context, size, simpleUIController)
                    ),

                  SizedBox(height: size.height * 0.2),

                  ///5th layout
                  if (Responsive.isDesktop(context) || Responsive.isTablet(context))
                    _buildLargeScreen3(context, size, simpleUIController),
                  if (Responsive.isMobile(context))
                    _buildSmallScreen3(context, size, simpleUIController),

                  SizedBox(height: size.height * 0.2),

                ],
              ),
            ),
          );
        });
  }

  Widget _tabBarLarge(){
    return Row(children: [
      Expanded(flex: 3, child: Container(),),
      Expanded(flex: 5,
        child: Container(
          margin: EdgeInsets.only(right: 120),
          child: HomePagesHeader()
      ),),
    ],);
  }

  /// For large screens
  Widget _buildLargeScreen(
      BuildContext context,
      Size size,
      SimpleUIController simpleUIController,
      ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: Container(
            margin: EdgeInsets.only(left: 120),
            child: _buildMainBody(
              context,
              size,
              simpleUIController,
            ),
          ),
        ),
        // SizedBox(width: size.width * 0.06),
        Expanded(
          flex: 8,
          child: Image.asset(
            "assets/images/blockchain.png",
            fit: BoxFit.contain,
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

  /// For large screens
  Widget _buildFeatureLargeScreen(
      BuildContext context,
      Size size,
      SimpleUIController simpleUIController,
      ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/features_icon03.png",
                fit: BoxFit.contain,
              ),
              Text(
                'Security',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: GainGermsTheme().getTheme().backGroundColor),
              ),
              Text(
                'The system is confidential, the same as Telegram, it has advanced protection against hacker attacks.',
                style: TextStyle(fontSize: 15, color: GainGermsTheme().getTheme().backGroundColor),
              ),
            ],
          ),
        ),
        // SizedBox(width: size.height * 0.03),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/features_icon04.png",
                fit: BoxFit.contain,
              ),
              Text(
                'Speed',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: GainGermsTheme().getTheme().backGroundColor),
              ),
              Text(
                'TON brings speed and scalability to a multi-blockchain architecture that allows to process several millions of transactions per second.',
                style: TextStyle(fontSize: 15, color: GainGermsTheme().getTheme().backGroundColor),
              ),
            ],
          ),
        ),
        // SizedBox(width: size.height * 0.03),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/features_icon01.png",
                fit: BoxFit.contain,
              ),
              Text(
                'Anonymity',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: GainGermsTheme().getTheme().backGroundColor),
              ),
              Text(
                'The complete anonymity of the client base and the absence of a public transaction history exclude any extraneous interference.',
                style: TextStyle(fontSize: 15, color: GainGermsTheme().getTheme().backGroundColor),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// For Small screens
  Widget _buildSmallFeatureScreen(
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

  /// For large screens
  Widget _buildLargeScreen2(
      BuildContext context,
      Size size,
      SimpleUIController simpleUIController,
      ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: Image.asset(
            "assets/images/services_iimg.png",
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(width: size.width * 0.06),
        Expanded(
          flex: 6,
          child: Container(
            margin: EdgeInsets.only(right: 120),
            child: _buildMainBody2(
              context,
              size,
              simpleUIController,
            ),
          ),
        ),
      ],
    );
  }

  /// For Small screens
  Widget _buildSmallScreen2(
      BuildContext context,
      Size size,
      SimpleUIController simpleUIController,
      ) {
    return Center(
      child: _buildMainBody2(
        context,
        size,
        simpleUIController,
      ),
    );
  }

  /// For large screens
  Widget _buildLargeScreen3(
      BuildContext context,
      Size size,
      SimpleUIController simpleUIController,
      ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: Container(
            margin: EdgeInsets.only(left: 120),
            child: _buildMainBody3(
              context,
              size,
              simpleUIController,
            ),
          ),
        ),
        SizedBox(width: size.width * 0.06),
        Expanded(
          flex: 6,
          child: Image.asset(
            "assets/images/third_img.png",
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  /// For Small screens
  Widget _buildSmallScreen3(
      BuildContext context,
      Size size,
      SimpleUIController simpleUIController,
      ) {
    return Center(
      child: _buildMainBody3(
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

    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: size.width > 600 ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.03,
          ),
          Text(
            'Start For Free Now',
            style: TextStyle(fontSize: 25, color: GainGermsTheme().getTheme().backGroundColor),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'GainGerms',
            style: TextStyle(fontSize: size.height * 0.08, fontWeight: FontWeight.bold, color: GainGermsTheme().getTheme().backGroundColor),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Text(
            'You have the unique possibility of access to the new GainGerms technologies. It is a new platform with incredible opportunities.',
            style: TextStyle(fontSize: 14, color: GainGermsTheme().getTheme().backGroundColor),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  AppRouterDelegate().setPathName(RouteData.login.name);
                },
                onHover: (hovering) {
                  setState(() => isHoveringLogin = hovering);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease,
                  padding: const EdgeInsets.only(left: 30, top: 12, right: 30, bottom: 12),
                  decoration: BoxDecoration(
                    color: isHoveringLogin == true ? GainGermsTheme().getTheme().backGroundColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: GainGermsTheme().getTheme().backGroundColor,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 15,
                        color: isHoveringLogin == true ? GainGermsTheme().getTheme().white : GainGermsTheme().getTheme().backGroundColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: (){
                  AppRouterDelegate().setPathName(RouteData.register.name);
                },
                onHover: (hovering) {
                  setState(() => isHoveringRegister = hovering);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease,
                  padding: const EdgeInsets.only(left: 30, top: 12, right: 30, bottom: 12),
                  decoration: BoxDecoration(
                    color: isHoveringRegister == true ? GainGermsTheme().getTheme().backGroundColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: GainGermsTheme().getTheme().backGroundColor,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 15,
                        color: isHoveringRegister == true ? GainGermsTheme().getTheme().white : GainGermsTheme().getTheme().backGroundColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
        ],
      ),
    );
  }

  /// Main Body 2
  Widget _buildMainBody2(
      BuildContext context,
      Size size,
      SimpleUIController simpleUIController,
      ) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: size.width > 600
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              'Digital Breakthrough',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: GainGermsTheme().getTheme().backGroundColor),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'GainGerms is a blockchain-based digital project developed to be fast, safe, scalable and capable of processing millions of transactions per second. It is designed to compete with Ethereum smart contracts and decentralized applications, while being extremely scalable.\n\nPrivate permissioned blockchains ensure, by definition, faster execution time than public permissionless blockchains because they rely on a small number of selected and trusted verifiers rather than requiring the consensus of a large amount of "anonymous" nodes, which need to be checked through ingenious algorithms.',
              style: TextStyle(fontSize: 14, color: GainGermsTheme().getTheme().backGroundColor),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }

  /// Main Body 3
  Widget _buildMainBody3(
      BuildContext context,
      Size size,
      SimpleUIController simpleUIController,
      ) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: size.width > 600
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              'Currency has never been so fast',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: GainGermsTheme().getTheme().backGroundColor),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Gram is faster than Bitcoin and Ethereum blockchains and can even outperform Visa and Mastercard in transaction speed - we talk about more than a million transactions per second.\nThe main principle is to execute transactions parallelly and to separate all the data into different small blockchains that can interact with each other.',
              style: TextStyle(fontSize: 14, color: GainGermsTheme().getTheme().backGroundColor),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }

}

