import 'dart:math';
import 'package:gain_germs_final/Theme/size_config.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../routes/route_delegate.dart';
import '../../routes/route_handeler.dart';
import '../../chart/resources/app_colors.dart';
import '../../Models/user_details.dart';
import '../../screens/user_level/index.dart';
import '../../screens/user_level/pie_chart.dart';
import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models/commonmodel.dart';
import '../../Models/random_winner_model.dart';
import '../../helper/shared_preferences.dart';
import '../../util/routes.dart';
import '../../Theme/theme.dart';

import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../header/header.dart';

class UserLevelScreen extends StatefulWidget {

  const UserLevelScreen({
    Key? key,
    required UserLevelBloc userLevelBloc,
  })  : _userLevelBloc = userLevelBloc,
        super(key: key);


  final UserLevelBloc _userLevelBloc;

  @override
  UserLevelScreenState createState() {
    return UserLevelScreenState();
  }
}


class UserLevelScreenState extends State<UserLevelScreen> {

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
    widget._userLevelBloc.add(LoadUserLevelEvent());
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
    return BlocConsumer<UserLevelBloc, UserLevelState>(
        bloc: widget._userLevelBloc,
        listener: (BuildContext context,
            UserLevelState currentState,) {
          if (currentState is UnUserLevelState) {
            isApiCall = true;
          }
          if (currentState is ErrorUserLevelState) {
            isApiCall = false;
            // errorHandling(currentState.errorMessage);
          }
          if (currentState is InUserLevelState) {
            isApiCall = false;
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

              int limit = userResponse?.customerData?.activityTimeline?.length ?? 0;
              for (int i = 0; i < limit; i++) {
                if (i > 5) break;
                activityTimeline.add(userResponse?.customerData?.activityTimeline![i]);
              }
            }
            print("userResponse - ${userResponse}");
          }
        },
        builder: (BuildContext context,
            UserLevelState currentState,) {
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
                  SizedBox(height: defaultPadding * 1.5),
                  Container(
                    child: Text(
                      "User Level",
                      style: headingOne(_size, Colors.white),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(height: defaultPadding * 1.2),
                  _size.width > 1300
                      ? getTopLayoutInTwoColumn(_size)
                      : getTopLayoutInOneColumn(_size),
                  SizedBox(height: defaultPadding * 1.2),
                  _size.width > 1300
                      ? getBottomLayoutInTwoColumn(_size, activityTimeline)
                      : getBottomLayoutInOneColumn(_size, activityTimeline),
                ],
              ),
            ),
          );
        });
  }

  Widget getTopLayoutInTwoColumn(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 5, child: getFirstLayout(size)),
          Container(
            child: Text("\n    \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"),
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: getSecondLayout(size),
              )),
        ],
      ),
    );
  }

  Widget getTopLayoutInOneColumn(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getFirstLayout(size),
          Container(
            height: 12,
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              // borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
          getSecondLayout(size),
        ],
      ),
    );
  }

  Widget getBottomLayoutInTwoColumn(Size size, List activityTimeline) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 5, child: getThirdLayout(size, activityTimeline)),
          Container(
            child: Text("\n    \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"),
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: getForthLayout(size),
              )),
        ],
      ),
    );
  }

  Widget getBottomLayoutInOneColumn(Size size, List activityTimeline) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getThirdLayout(size, activityTimeline),
          Container(
            height: 12,
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
          getForthLayout(size),
        ],
      ),
    );
  }

  Widget getFirstLayout(Size size) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Category",
                style: headingOne(size, Colors.white),
              ),
              SizedBox(height: defaultPadding*2.2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          UserLevelPieChart(),
                          SizedBox(height: defaultPadding),
                        ],
                      )),
                  Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Container(
                                height: 12,
                                width: 12,
                                decoration: BoxDecoration(
                                  color: AppColors.contentColorBlue,
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(6)),
                                ),
                              ),
                              SizedBox(width: 3),
                              Text(
                                "Online",
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(children: [
                            Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                color: AppColors.contentColorYellow,
                                borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                              ),
                            ),
                            SizedBox(width: 3),
                            Text(
                              "Free",
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                          SizedBox(height: 5),
                          Row(children: [
                            Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                color: AppColors.contentColorPurple,
                                borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                              ),
                            ),
                            SizedBox(width: 3),
                            Text(
                              "Referrals",
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                          SizedBox(height: 5),
                          Row(children: [
                            Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                color: AppColors.contentColorGreen,
                                borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                              ),
                            ),
                            SizedBox(width: 3),
                            Text(
                              "Videos",
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                          SizedBox(height: 5),
                          Row(children: [
                            Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                color: AppColors.contentColorGreen,
                                borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                              ),
                            ),
                            SizedBox(width: 3),
                            Text(
                              "Smart-Contract",
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                          SizedBox(height: 5),
                          Row(children: [
                            Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                color: AppColors.contentColorGreen,
                                borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                              ),
                            ),
                            SizedBox(width: 3),
                            Text(
                              "Lottery",
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                        ],
                      )),
                ],
              ),
              SizedBox(height: defaultPadding*1.2),
            ],
          ),
        ),
      ],
    );
  }

  Widget getSecondLayout(Size size) {
    double userLevelPoint = double.parse(userResponse?.customerData?.userLevelPoints ?? "1");
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(defaultPadding),
          // decoration: BoxDecoration(
          //   color: secondaryColor,
          //   borderRadius: const BorderRadius.all(Radius.circular(10)),
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Current Level",
                style: headingOne(size, Colors.white),
              ),
              SizedBox(height: defaultPadding),
              CircularSeekBar(
                width: double.infinity,
                height: 250,
                progress: userLevelPoint,
                barWidth: 22,
                startAngle: 45,
                sweepAngle: 270,
                strokeCap: StrokeCap.round,
                progressGradientColors: const [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.indigo, Colors.purple],
                innerThumbRadius: 0,
                innerThumbStrokeWidth: 0,
                innerThumbColor: Colors.white,
                outerThumbRadius: 0,
                interactive: false,
                outerThumbStrokeWidth: 20,
                outerThumbColor: Colors.blueAccent,
                animation: true,
                child: Center(
                  child: Text("${userResponse?.customerData?.userLevelPoints}%", style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold)),
                ),
              ),
              // Chart(),
              SizedBox(height: defaultPadding),
              Container(
                height: 2,
                decoration: BoxDecoration(
                  color: GainGermsTheme().getTheme().backGroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
              // SizedBox(height: defaultPadding),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        SizedBox(height: defaultPadding),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Current Level",
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "${userResponse?.customerData?.userLevel}",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Text("\n  \n\n\n"),
                    decoration: BoxDecoration(
                      color: GainGermsTheme().getTheme().backGroundColor,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SizedBox(height: defaultPadding),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Level Award",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "${userResponse?.customerData?.levelAward}" + " " + "Germs",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                            ),
                          )
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget getThirdLayout(Size size, List activityTimeline) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Activity Timeline",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          activityTimeline.length >= 1 ?
          activityTimelineDataRoww(
            index: 0,
            userResponse: activityTimeline[0],
          ) : Container(),
          activityTimeline.length >= 2 ?
          activityTimelineDataRoww(
            index: 1,
            userResponse: activityTimeline[1],
          ) : Container(),
          activityTimeline.length >= 3 ?
          activityTimelineDataRoww(
            index: 2,
            userResponse: activityTimeline[2],
          ) : Container(),
          activityTimeline.length >= 4 ?
          activityTimelineDataRoww(
            index: 3,
            userResponse: activityTimeline[3],
          ) : Container(),
          activityTimeline.length >= 5 ?
          activityTimelineDataRoww(
            index: 4,
            userResponse: activityTimeline[4],
          ) : Container(),
          activityTimeline.length >= 6 ?
          activityTimelineDataRoww(
            index: 5,
            userResponse: activityTimeline[5],
          ) : Container(),
        ],
      ),
    );
  }

  Widget getForthLayout(Size size) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bonus Table",
            style: headingOne(size, Colors.white),
          ),
          Text(
            "Reward for the Following Actions",
            style: kLoginTermsAndPrivacyStyle(size, Colors.white),
          ),


          /// Row 1
          SizedBox(height: defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("New Day Activity",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.normal)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  "+1 point",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: defaultPadding/2),
          Container(
            height: 1,
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),

          /// Row 2
          SizedBox(height: defaultPadding/2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Free Roll",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.normal)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  "+1 point",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: defaultPadding/2),
          Container(
            height: 1,
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),

          /// Row 3
          SizedBox(height: defaultPadding/2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Invitation of a Friend",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.normal)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  "+5 point",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: defaultPadding/2),
          Container(
            height: 1,
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),

          /// Row 4
          SizedBox(height: defaultPadding/2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Referrals reached to 2nd Level",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.normal)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                decoration: BoxDecoration(
                  color: Colors.indigoAccent.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  "+10 point",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: defaultPadding/2),
          Container(
            height: 1,
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),

          /// Row 5
          SizedBox(height: defaultPadding/2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Smart Contract was Concluded",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.normal)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  "+2 point",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: defaultPadding/2),
          Container(
            height: 1,
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),

          /// Row 6
          SizedBox(height: defaultPadding/2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Smart Contract was Confirmed",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.normal)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  "+1 point",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: defaultPadding/2),
          Container(
            height: 1,
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),

          /// Row 7
          SizedBox(height: defaultPadding/2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Smart Contract was Singed",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.normal)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  "+5 point",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: defaultPadding/2),
          Container(
            height: 1,
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),

          /// Row 8
          SizedBox(height: defaultPadding/2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Play Lottery",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.normal)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  "+2 point",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: defaultPadding/2),
          Container(
            height: 1,
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),

          /// Row 9
          SizedBox(height: defaultPadding/2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Youtube Video Watched",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.normal)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                decoration: BoxDecoration(
                  color: Colors.indigoAccent.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  "+1 point",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: defaultPadding/2),
          Container(
            height: 1,
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),

          /// Row 10
          SizedBox(height: defaultPadding/2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("New Video was Approved",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.normal)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  "+10 point",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: defaultPadding/2),
          Container(
            height: 1,
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),

        ],
      ),
    );
  }
}

class activityTimelineDataRoww extends StatelessWidget {
  const activityTimelineDataRoww({Key? key, required this.index, required this.userResponse})
      : super(key: key);

  final int index;
  final ActivityTimelinee? userResponse;

  @override
  Widget build(BuildContext context) {
    String timeToDisplay = "few seconds ago";
    String lastActivityTimeString = userResponse?.activityTime ?? "0";
    int lastActivityTime = int.parse(lastActivityTimeString);
    DateTime dt = DateTime.fromMicrosecondsSinceEpoch(lastActivityTime);

    String descriptions = userResponse?.titleDescription ?? "";
    final splitted = descriptions.split('-');
    String title = splitted[0];
    String description = splitted[1];

    if(dt.minute == DateTime.now().minute){
      timeToDisplay = "few seconds ago";
    }else if(dt.hour == DateTime.now().hour){
      timeToDisplay = "few minutes ago";
    }else if(dt.day == DateTime.now().day){
      timeToDisplay = "few hours ago";
    }else if(dt.day < DateTime.now().day){
      timeToDisplay = "few days ago";
    }

    String iconString = "";
    if(description.contains("Roll")){
      iconString = "assets/images/roll.png";
    }else if(description.contains("Referral")){
      iconString = "assets/images/referrals.png";
    }else if(description.contains("Signing")){
      iconString = "assets/images/smart_contract.png";
    }else if(description.contains("Video")){
      iconString = "assets/images/videos.png";
    } else if(description.contains("Daily")){
      iconString = "assets/images/graph.png";
    }

    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(2),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: getColorr(Random().nextInt(20)).withOpacity(0.1),
              // color: info.color!.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Image.asset(
              iconString,
              height: 22,
              color: getColorr(Random().nextInt(20)).withOpacity(0.9),
              // color: info.color!.withOpacity(0.9),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.white)),
                  Text(
                    description,
                    //getDescription(rng.nextInt(1838)),
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.white70),
                  ),
                  Text(
                    timeToDisplay,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
