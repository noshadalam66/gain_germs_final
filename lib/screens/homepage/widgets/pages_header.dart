import '../../../Theme/theme.dart';
import '../../../constants/constants.dart';
import 'package:flutter/material.dart';
import '../../../routes/route_delegate.dart';
import '../../../routes/route_handeler.dart';

class HomePagesHeader extends StatelessWidget {
  const HomePagesHeader({
    Key? key,
  })  : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              AppRouterDelegate().setPathName(RouteData.homePage.name);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.ease,
              child: Text(
                'HOME',
                style: TextStyle(fontSize: 15,
                    color: GainGermsTheme().getTheme().backGroundColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              AppRouterDelegate().setPathName(RouteData.login.name);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.ease,
              child: Text(
                'ABOUT US',
                style: TextStyle(fontSize: 15,
                    color: GainGermsTheme().getTheme().backGroundColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              AppRouterDelegate().setPathName(RouteData.login.name);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.ease,
              child: Text(
                'CONTACT US',
                style: TextStyle(fontSize: 15,
                    color: GainGermsTheme().getTheme().backGroundColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              AppRouterDelegate().setPathName(RouteData.privacy_policy.name);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.ease,
              child: Text(
                'PRIVACY POLICY',
                style: TextStyle(fontSize: 15,
                    color: GainGermsTheme().getTheme().backGroundColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              AppRouterDelegate().setPathName(RouteData.term_and_condition.name);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.ease,
              child: Text(
                'TERM & CONDITIONS',
                style: TextStyle(fontSize: 15,
                    color: GainGermsTheme().getTheme().backGroundColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  })  : super(key: key);


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      child: Row(
        children: [
          SizedBox(
            width: 40, //responsiveWidth(48),
            height: 40, //responsiveHeight(48.0),
            child: CircleAvatar(
              radius: 20, //responsiveWidth(20),
              child: Text(
                getProfileShortName("asd"),
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
                child: Text("Noshad "),
              ),
              Text("Level ")
            ],
          )

          // Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

// class ProgressLine extends StatelessWidget {
//   const ProgressLine({
//     Key? key,
//     this.color = primaryColor,
//     required this.percentage,
//   }) : super(key: key);
//
//   final Color? color;
//   final int? percentage;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           width: double.infinity,
//           height: 25,
//           decoration: BoxDecoration(
//             color: color!.withOpacity(0.1),
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//           ),
//         ),
//         LayoutBuilder(
//           builder: (context, constraints) => Container(
//             width: constraints.maxWidth * (percentage! / 100),
//             height: 25,
//             decoration: BoxDecoration(
//               color: color,
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class SearchField extends StatelessWidget {
//   const SearchField({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: InputDecoration(
//         hintText: "Search",
//         fillColor: secondaryColor,
//         filled: true,
//         border: OutlineInputBorder(
//           borderSide: BorderSide.none,
//           borderRadius: const BorderRadius.all(Radius.circular(10)),
//         ),
//         suffixIcon: InkWell(
//           onTap: () {},
//           child: Container(
//             padding: EdgeInsets.all(defaultPadding * 0.75),
//             margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
//             decoration: BoxDecoration(
//               color: primaryColor,
//               borderRadius: const BorderRadius.all(Radius.circular(10)),
//             ),
//             child: SvgPicture.asset("assets/images/g.png"),
//           ),
//         ),
//       ),
//     );
//   }
// }
