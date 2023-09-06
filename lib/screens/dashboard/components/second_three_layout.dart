import '../../../screens/dashboard/components/third_four_layout_info_card.dart';
import '../../../screens/dashboard/components/second_three_layout_info_card.dart';
import '../../../Models//MyFiles.dart';
import '../../../responsive.dart';
import 'package:flutter/material.dart';
import '../../../constants/constants.dart';

import '../../../Models/user_details.dart';


class SecondThreeLayout extends StatelessWidget {
  const SecondThreeLayout({
    Key? key,
    required UserResponse? userResponse,
  })  : _userResponse = userResponse,
        super(key: key);

  final UserResponse? _userResponse;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: defaultPadding),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 1 : 2,
            childAspectRatio: _size.width < 650 && _size.width > 350 ? 2.3 : 2.2,
              userResponse: _userResponse
          ),
          tablet: FileInfoCardGridView(
            childAspectRatio: _size.width < 1100 ? 1.8 : 2.0,
              userResponse: _userResponse
          ),
          desktop: FileInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 2.1 : 2.1,
              userResponse: _userResponse
          ),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 3,
    this.childAspectRatio = 1,
    required UserResponse? userResponse,
  }) : _userResponse = userResponse, super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  final UserResponse? _userResponse;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,//demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => SecondThreeLayoutInfoCard(info: _userResponse, index: index),
    );
  }
}
