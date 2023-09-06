import '../../../Theme/theme.dart';
import '../../../Models/user_details.dart';
import 'package:easy_localization/easy_localization.dart';

// import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';


class LastThreeReferrals extends StatelessWidget {
  const LastThreeReferrals({
    Key? key,
    required UserResponse? userResponse,
  })  : _userResponse = userResponse,
        super(key: key);

  final UserResponse? _userResponse;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    List referrals = [];
    int limit = _userResponse?.customerData?.referrals?.length ?? 0;
    for (int i = 0; i < limit; i++) {
      if (i > 2) break;
      referrals.add(_userResponse?.customerData?.referrals![i]);
    }

    return Container(
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
              "Last 3 Referrals",
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
                columnSpacing: 40, //defaultPadding,
                // minWidth: 600,
                columns: [
                  DataColumn(
                    label: Text('name'.tr().toString() + "   ",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('status'.tr().toString() + "      ",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('progress'.tr().toString() + "      ",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('level'.tr().toString() + "      ",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('last_activity'.tr().toString() + "   ",
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
                      recentFileDataRow(referrals[index], context, index), //
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(Referrals fileInfo, BuildContext context, int index) {
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
      DataCell(userLevel == 1 ? Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
                color: Colors.orange, borderRadius: BorderRadius.circular(8)),
          ),
          SizedBox(width: 4,),
          Text('in_progress'.tr().toString(),
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.white))
        ],
      ) :
      Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(8)),
          ),
          SizedBox(width: 4,),
          Text('completed'.tr().toString(),
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.white))
        ],
      )),
      DataCell( userLevel == 1 ?
      Text("${userLevelPoint}" + "%",
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(color: Colors.white)) :
      Text("100%",
          style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(color: Colors.white))
      ),
      DataCell(
        Text("${userLevel} " + 'level_caps'.tr().toString(),
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

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 25,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 25,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
