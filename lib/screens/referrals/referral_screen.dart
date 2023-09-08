import '../../Models/user_details.dart';
import '../../screens/referrals/index.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../Models/commonmodel.dart';
import '../../helper/shared_preferences.dart';
import '../../util/routes.dart';
import '../../Theme/theme.dart';

import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../header/header.dart';
import '../../routes/route_delegate.dart';
import '../../routes/route_handeler.dart';
import '../bar_chart/bar_chart_constants.dart';
import '../bar_chart/users.dart';

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({
    Key? key,
    required ReferralsBloc referralsBloc,
  })  : _referralsBloc = referralsBloc,
        super(key: key);

  final ReferralsBloc _referralsBloc;

  @override
  ReferralScreenState createState() {
    return ReferralScreenState();
  }
}

class ReferralScreenState extends State<ReferralScreen> {
  List referrals = [];

  UserResponse? userResponse;
  bool isApiCall = true;
  bool showData = false;

  @override
  initState() {
    super.initState();
    _load();

    getBoolValuesSF(isLoggedIn).then((value) => {
      if (!value){AppRouterDelegate().setPathName(RouteData.login.name, loggedIn: false)}
    });
    // html.window.history.pushState({}, '', '/referrals');

  }

  void _load(){
    userResponse = getUserDetail();
    widget._referralsBloc.add(LoadReferralsEvent());
  }

  void setValue(UserResponse ur, bool sd){
    setUserDetail(ur);
    userResponse = ur;
    isApiCall = false;
    showData = sd;
  }

  @override
  Widget build(BuildContext context) {
    int limit = userResponse?.customerData?.referrals?.length ?? 0;
    for (int i = 0; i < limit; i++) {
      referrals.add(userResponse?.customerData?.referrals![i]);
    }
    final Size _size = MediaQuery.of(context).size;
    return BlocConsumer<ReferralsBloc, ReferralsState>(
        bloc: widget._referralsBloc,
        listener: (BuildContext context,
            ReferralsState currentState,) {
          if (currentState is UnReferralsState) {
            isApiCall = true;
          }
          if (currentState is ErrorReferralsState) {
            isApiCall = false;
            // errorHandling(currentState.errorMessage);
          }
          if (currentState is InReferralsState) {
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
              setValue(userResponse!, currentState.showData);
            }
          }
        },
        builder: (BuildContext context,
            ReferralsState currentState,) {
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
                      "Referrals",
                      style: headingOne(_size, Colors.white),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(height: defaultPadding * 1.2),
                  _size.width > 1300
                      ? getTopLayoutInThreeColumn(_size)
                      : _size.width < 1300 && _size.width > 800
                      ? getTopLayoutInTwoColumn(_size)
                      : getTopLayoutInOneColumn(_size),
                  SizedBox(height: defaultPadding * 1.2),
                  getRetentionGraph(_size),
                  SizedBox(height: defaultPadding * 1.2),
                  getReferralsList(_size),
                ],
              ),
            ),
          );
        });
  }

  Widget getTopLayoutInThreeColumn(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 10, child: getFirstLayout(size)),
          Container(
            child: Text("\n    \n\n\n\n\n"),
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: getSecondLayout(size),
              )),
          Container(
            child: Text("\n    \n\n\n\n\n"),
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
          ),
          Expanded(flex: 4, child: getThirdLayout(size))
        ],
      ),
    );
  }

  Widget getTopLayoutInTwoColumn(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          getFirstLayout(size),
          SizedBox(
            height: defaultPadding,
            child: Container(
              decoration: BoxDecoration(
                  color: GainGermsTheme().getTheme().backGroundColor),
            ),
          ),
          Row(
            children: [
              Expanded(flex: 5, child: getSecondLayout(size)),
              Container(
                child: Text("\n    \n\n\n\n\n"),
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
                    child: getThirdLayout(size),
                  )),
            ],
          ),
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
          SizedBox(
            height: defaultPadding,
            child: Container(
              decoration: BoxDecoration(
                  color: GainGermsTheme().getTheme().backGroundColor),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: getSecondLayout(size),
          ),
          SizedBox(
            height: defaultPadding,
            child: Container(
              decoration: BoxDecoration(
                  color: GainGermsTheme().getTheme().backGroundColor),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: getThirdLayout(size),
          ),
          //Expanded(flex: 8, child: getThirdLayout(size))
        ],
      ),
    );
  }

  Widget getFirstLayout(Size size) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: size.width > 600
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(defaultPadding * 0.65),
                  child: Text(
                    "Referral Link",
                    style: headingOne(size, Colors.white),
                  ),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: defaultPadding / 2,
                            bottom: defaultPadding / 2,
                            left: defaultPadding / 2,
                            right: defaultPadding / 2),
                        child: Text(
                          "https://gaingerms.com/register?invitedby=" +
                              "${userResponse?.customerData?.refCode}",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                color: Colors.black,
                              ),
                        ),
                        decoration: BoxDecoration(
                          color: GainGermsTheme().getTheme().white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.only(
                                  left: defaultPadding * 2,
                                  top: defaultPadding,
                                  right: defaultPadding * 2,
                                  bottom: defaultPadding)),
                          backgroundColor: MaterialStateProperty.all(
                              GainGermsTheme().getTheme().buttonColor),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(defaultPadding / 2),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(
                                  text: "https://gaingerms.com/register?invitedby=" +
                                      "${userResponse?.customerData?.refCode}"))
                              .then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                  "App link is copied to clipboard",)));
                          });
                        },
                        child: Text("Copy!",),
                      ),
                    ]),
                // Icon(Icons.more_vert, color: Colors.white54)
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Referral Link",
                    style: headingOne(size, Colors.white),
                  ),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: defaultPadding / 2,
                      bottom: defaultPadding / 2,
                      left: defaultPadding / 2,
                      right: defaultPadding / 2),
                  child: Text(
                    "https://gaingerms.com/register?invitedby=" +
                        "${userResponse?.customerData?.refCode}",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  decoration: BoxDecoration(
                    color: GainGermsTheme().getTheme().white,
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                  ),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.only(
                            left: defaultPadding * 2,
                            top: defaultPadding,
                            right: defaultPadding * 2,
                            bottom: defaultPadding)),
                    backgroundColor: MaterialStateProperty.all(
                        GainGermsTheme().getTheme().buttonColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultPadding / 2),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                            text: "https://gaingerms.com/register?invitedby=" +
                                "${userResponse?.customerData?.refCode}"))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("App link is copied to clipboard")));
                    });
                  },
                  child: Text("Copy!"),
                ),
              ],
            ),
    );
  }

  Widget getSecondLayout(Size size) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(defaultPadding * 0.7),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Image.asset(
              "assets/images/referrals.png",
              height: 28,
              color: primaryColor.withOpacity(0.9),
            ),
          ),
          SizedBox(height: defaultPadding / 2),
          Text(
            "${userResponse?.customerData?.noOfReferrals}",
            textAlign: TextAlign.center,
            style: headingOne(size, Colors.white),
          ),
          SizedBox(height: defaultPadding / 2),
          Text(
            "Total Invited",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }

  Widget getThirdLayout(Size size) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(defaultPadding * 0.7),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.cyan.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Image.asset(
              "assets/images/in_pending.png",
              height: 28,
              color: Colors.cyan.withOpacity(0.9),
            ),
          ),
          SizedBox(height: defaultPadding / 2),
          Text(
            "${userResponse?.customerData?.pendingReferrals}",
            textAlign: TextAlign.center,
            style: headingOne(size, Colors.white),
          ),
          SizedBox(height: defaultPadding / 2),
          Text(
            "In Pending",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }

  Widget getRetentionGraph(Size size) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Retention",
                style: headingOne(size, Colors.white),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: defaultPadding,),
                  Row(children: [Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      color: primaryColorr,
                      borderRadius:
                      const BorderRadius.all(Radius.circular(6)),
                    ),
                  ),
                    SizedBox(width: 3),
                    Text(
                      "Active Referrals",
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.white,
                      ),
                    ),],),
                  SizedBox(height: defaultPadding/3,),
                  Row(children: [Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      color: orange,
                      borderRadius:
                      const BorderRadius.all(Radius.circular(6)),
                    ),
                  ),
                    SizedBox(width: 3),
                    Text(
                      "Retained Referrals",
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.white,
                      ),
                    ),],),
                  SizedBox(height: defaultPadding/3,),
                  Row(children: [Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      color: lightTextColor,
                      borderRadius:
                      const BorderRadius.all(Radius.circular(6)),
                    ),
                  ),
                    SizedBox(width: 3),
                    Text(
                      "Inactive Referrals",
                      style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.white,
                      ),
                    ),],)

                ],
              ),
            ],
          ),
          SizedBox(height: defaultPadding * 1.5),
          Users(userResponse: userResponse),
          // SizedBox(height: defaultPadding),
          // SizedBox(height: defaultPadding),
          // SizedBox(height: 6),
          // Chart(),
        ],
      ),
    );
  }

  Widget getReferralsList(Size size) {
    return Container(
      // color: GainGermsTheme().getTheme().backGroundColor.withOpacity(0.9),
      // padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(defaultPadding),
            child: Text(
              "Your Friends",
              style: headingOne(size, Colors.white),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: MaterialStateColor.resolveWith((states) =>
                    GainGermsTheme()
                        .getTheme()
                        .backGroundColor
                        .withOpacity(0.5)),
                columnSpacing: 40,
                columns: [
                  DataColumn(
                    label: Text("Name" + "   ",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text("Status" + "      ",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text("Progress" + "      ",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text("Level" + "      ",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text("Last Activity" + "   ",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
                rows: List.generate(
                  referrals.length,
                  (index) =>
                      referralsListDataRow(referrals[index], context, index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow referralsListDataRow(
      Referrals fileInfo, BuildContext context, int index) {
    int userLevel = int.parse(fileInfo.userLevel ?? "1");
    int userLevelPoint = int.parse(fileInfo.userLevelPoints ?? "1");
    String date = fileInfo.lastLogin ?? "";
    return DataRow(
      cells: [
        DataCell(
          Text(fileInfo.fullName ?? "",
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.white)),
        ),
        DataCell(userLevel == 1
            ? Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text("In Progress",
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.white))
                ],
              )
            : Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text("Completed",
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.white))
                ],
              )),
        DataCell(userLevel == 1
            ? Text("${userLevelPoint}" + "%",
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.white))
            : Text("100%",
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.white))),
        DataCell(
          Text("${userLevel} " + "LEVEL",
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.white)),
        ),
        DataCell(
          Text(date,
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.white)),
        ),
      ],
    );
  }
}
