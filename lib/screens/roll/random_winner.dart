import 'dart:async';
import 'dart:math';
import '../../Theme/size_config.dart';
import '../../Theme/theme.dart';
import '../../Theme/typography.dart';
import '../../Models/random_winner_model.dart';
import '../../screens/roll/roll_screen.dart';

import 'package:flutter/material.dart';
import '../../constants/constants.dart';

class RandomWinners extends StatefulWidget {
  const RandomWinners({Key? key}) : super(key: key);

  @override
  RandomWinnersState createState() {
    return RandomWinnersState();
  }
}

class RandomWinnersState extends State<RandomWinners> {
  Timer? timer;
  var rng = Random();
  int count = 0;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        Duration(seconds: 4), (Timer t) => checkForNewSharedLists());
  }

  @override
  Widget build(BuildContext context) {
    if(sixName[0].length == 0){
      sixName[0] = getName(rng.nextInt(1838));
      sixName[1] = getName(rng.nextInt(1838));
      sixName[2] = getName(rng.nextInt(1838));
      sixName[3] = getName(rng.nextInt(1838));
      sixName[4] = getName(rng.nextInt(1838));
      sixName[5] = getName(rng.nextInt(1838));

      sixDescription[0] = getDescription(rng.nextInt(1000));
      sixDescription[1] = getDescription(rng.nextInt(1000));
      sixDescription[2] = getDescription(rng.nextInt(1000));
      sixDescription[3] = getDescription(rng.nextInt(1000));
      sixDescription[4] = getDescription(rng.nextInt(1000));
      sixDescription[5] = getDescription(rng.nextInt(1000));

      sixColors[0] = getColorr(rng.nextInt(20));
      sixColors[1] = getColorr(rng.nextInt(20));
      sixColors[2] = getColorr(rng.nextInt(20));
      sixColors[3] = getColorr(rng.nextInt(20));
      sixColors[4] = getColorr(rng.nextInt(20));
      sixColors[5] = getColorr(rng.nextInt(20));
    }
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      // decoration: BoxDecoration(
      //   color: secondaryColor,
      //   borderRadius: const BorderRadius.all(Radius.circular(10)),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Wons",
            style: headingOne(size, Colors.white),
          ),
          SizedBox(height: defaultPadding),
          rondomWinnersRow(index: 0,),
          rondomWinnersRow(index: 1,),
          rondomWinnersRow(index: 2,),
          rondomWinnersRow(index: 3,),
          rondomWinnersRow(index: 4,),
          rondomWinnersRow(index: 5,),
        ],
      ),
    );
  }

  void checkForNewSharedLists() {
    // do request here
    var rng = Random();

    sixName[0] = sixName[1];
    sixName[1] = sixName[2];
    sixName[2] = sixName[3];
    sixName[3] = sixName[4];
    sixName[4] = sixName[5];
    sixName[5] = myRoll == true ? "You" : getName(rng.nextInt(1838));

    sixDescription[0] = sixDescription[1];
    sixDescription[1] = sixDescription[2];
    sixDescription[2] = sixDescription[3];
    sixDescription[3] = sixDescription[4];
    sixDescription[4] = sixDescription[5];
    sixDescription[5] = myRoll == true ? getDescription(number) : getDescription(rng.nextInt(1000));

    if(myRoll)
      myRoll = !myRoll;

    sixColors[0] = sixColors[1];
    sixColors[1] = sixColors[2];
    sixColors[2] = sixColors[3];
    sixColors[3] = sixColors[4];
    sixColors[4] = sixColors[5];
    sixColors[5] = getColorr(rng.nextInt(20));

    count = count + 1;
    setState(() {
      // change state according to result of request
    });
  }
}


class rondomWinnersRow extends StatelessWidget {
  const rondomWinnersRow({
    Key? key, required this.index
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    var rng = Random();
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(2),
      child: Row(
        children: [
          SizedBox(
            width: 48, //responsiveWidth(48),
            height: 48, //responsiveHeight(48.0),
            child: CircleAvatar(
              radius: 20, //responsiveWidth(20),
              child: Text(
                getProfileShortName(sixName[index]),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              backgroundColor: sixColors[index],
              // foregroundColor: GainGermsTheme()
              //     .getTheme()
              //     .color3
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(sixName[index],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.white)),
                  Text(
                    sixDescription[index],//getDescription(rng.nextInt(1838)),
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.white70),
                  ),
                  Text(
                    "few second ago",
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
