import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/constants.dart';

class ActivityTimelineInfoCard extends StatelessWidget {
  const ActivityTimelineInfoCard({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.amountOfFiles,
    required this.numOfFiles,
  }) : super(key: key);

  final String title, svgSrc, amountOfFiles;
  final int numOfFiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(2),
      child: Row(
        children: [
          Icon(Icons.more_vert, color: Colors.white54),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.white)
                  ),
                  Text(
                    "$numOfFiles Files",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
          Text(amountOfFiles,style: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(color: Colors.white70),)
        ],
      ),
    );
  }
}
