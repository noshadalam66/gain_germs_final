import 'dart:math';
import '../../bar_chart/bar_chart_constants.dart';
import '../../bar_chart/users.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import '../../../Theme/theme.dart';
import '../../../chart/resources/app_colors.dart';
import '../../../Models/random_winner_model.dart';
import '../../../Models/user_details.dart';

class ActivityTimeline extends StatelessWidget {
  const ActivityTimeline({
    Key? key,
    required UserResponse? userResponse,
  })  : _userResponse = userResponse,
        super(key: key);

  final UserResponse? _userResponse;


  @override
  Widget build(BuildContext context) {
    List activityTimeline = [];
    int limit = _userResponse?.customerData?.activityTimeline?.length ?? 0;
    for (int i = 0; i < limit; i++) {
      if (i > 4) break;
      activityTimeline.add(_userResponse?.customerData?.activityTimeline![i]);
    }

    final Size _size = MediaQuery.of(context).size;
    return _size.width > 1000
        ?Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: getTwoColumn(_size, context, _userResponse, activityTimeline),
    ) : getOneColumn(_size, _userResponse, activityTimeline, context);

  }
}

Widget getTwoColumn(Size size, BuildContext context, UserResponse? userResponse, List activityTimeline) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: getActivityTimelineWidget(activityTimeline, size),
          )),
      Container(
        child: Text(
            "\n    \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"),
        decoration: BoxDecoration(
          color: GainGermsTheme().getTheme().backGroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
      // SizedBox(width: defaultPadding),
      Expanded(
          flex: 7,
          child: Container(
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
                      'retention'.tr().toString(),
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
                            'active_referrals'.tr().toString(),
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
                            'retained_referrals'.tr().toString(),
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
                            'inactive_referrals'.tr().toString(),
                            style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.white,
                            ),
                          ),],)

                      ],
                    ),
                  ],
                ),
                // SizedBox(height: defaultPadding),
                Users(userResponse: userResponse),
              ],
            ),
          )),
    ],
  );
}

Widget getOneColumn(Size size, UserResponse? userResponse, List activityTimeline, BuildContext context) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: getActivityTimelineWidget(activityTimeline, size)
        ),
      ),
      SizedBox(height: defaultPadding),
      Container(
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
                  'retention'.tr().toString(),
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
                        'active_referrals'.tr().toString(),
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
                        'retained_referrals'.tr().toString(),
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
                        'inactive_referrals'.tr().toString(),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.white,
                        ),
                      ),],)

                  ],
                ),
              ],
            ),
            SizedBox(height: defaultPadding),
            Users(userResponse: userResponse),
            // PieChartSample3(),
          ],
        ),
      ),
    ],
  );
}

getActivityTimelineWidget(List activityTimeline, Size size){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'activity_timeline'.tr().toString(),
        style: headingOne(size, Colors.white),
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
    ],
  );
}

class activityTimelineDataRoww extends StatelessWidget {
  const activityTimelineDataRoww({Key? key, required this.index, required this.userResponse})
      : super(key: key);


  final int index;
  final ActivityTimelinee? userResponse;

  @override
  Widget build(BuildContext context) {
    String timeToDisplay = "few second ago";
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