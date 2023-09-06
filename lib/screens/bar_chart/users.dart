import 'package:flutter/material.dart';
import '../../Models/user_details.dart';
import 'bar_chart_constants.dart';

import 'bar_chart_user.dart';

class Users extends StatelessWidget {
  const Users({Key? key, required UserResponse? userResponse,})
      : _userResponse = userResponse, super(key: key);
  final UserResponse? _userResponse;


  @override
  Widget build(BuildContext context) {

    List<Referrals> referrals = [];

    int limit = _userResponse?.customerData?.referrals?.length ?? 0;
    for (int i = 0; i < limit; i++) {
      Referrals? ref = _userResponse?.customerData?.referrals?.elementAt(i);
      referrals.add(ref!);
    }

    return Container(
      height: 380,
      width: double.infinity,
      padding: EdgeInsets.all(appPadding),
      decoration: BoxDecoration(
        // color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "Users",
          //   style: TextStyle(
          //     fontWeight: FontWeight.w700,
          //     fontSize: 15,
          //     color: textColor,
          //   ),
          // ),
          Expanded(
            child: BarChartUsers(referrals: referrals),
          )
        ],
      ),
    );
  }
}
