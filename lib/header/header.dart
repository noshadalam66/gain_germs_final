import '../Theme/theme.dart';
import '../controllers/MyMenuController.dart';
import '../Models/commonmodel.dart';
import '../Models/user_details.dart';
import '../responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required UserResponse? userResponse,
  })  : _userResponse = userResponse,
        super(key: key);

  final UserResponse? _userResponse;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: GainGermsTheme().getTheme().layoutColor,
      padding: EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xff262D47),
        borderRadius: BorderRadius.all(Radius.circular(10.0)
        ),
      ),
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: context.read<MyMenuController>().controlMenu,
            ),
          // if (!Responsive.isMobile(context))
          //   Text(
          //     "",//"Dashboard",
          //     style: Theme.of(context).textTheme.headline6,
          //   ),
          // if (!Responsive.isMobile(context))
            // Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),

            // Expanded(child: SearchField()),
            Text("${_userResponse?.customerData?.userLevelPoints}/${_userResponse?.customerData?.userLevel}", style: TextStyle(color: Colors.white),),
            SizedBox(width: 10,),
            Expanded(flex: 6, child: SizedBox(
              height: 15,
              child: ProgressLine(
                color: Colors.green,
                percentage: int.parse(_userResponse?.customerData?.userLevelPoints ?? "1"),
              )
            )),
            ProfileCard(userResponse: userResponse,)
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required UserResponse? userResponse,
  })  : _userResponse = userResponse,
        super(key: key);

  final UserResponse? _userResponse;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      // padding: EdgeInsets.symmetric(
      //   horizontal: defaultPadding,
      //   vertical: defaultPadding / 2,
      // ),
      // decoration: BoxDecoration(
      //   color: secondaryColor,
      //   borderRadius: const BorderRadius.all(Radius.circular(10)),
      //   border: Border.all(color: Colors.white10),
      // ),
      child: Row(
        children: [
          SizedBox(
            width: 40, //responsiveWidth(48),
            height: 40, //responsiveHeight(48.0),
            child: CircleAvatar(
              radius: 20, //responsiveWidth(20),
              child: Text(
                getProfileShortName(_userResponse?.customerData?.fullName),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.green.withOpacity(0.5),
              // foregroundColor: GainGermsTheme()
              //     .getTheme()
              //     .color3
            ),
          ),
          size.width < 600 ? Container() :
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                child: Text("${_userResponse?.customerData?.fullName}"),
              ),
              Text("Level ${_userResponse?.customerData?.userLevel}")
            ],
          )

          // Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
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

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/images/g.png"),
          ),
        ),
      ),
    );
  }
}
