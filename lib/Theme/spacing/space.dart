
import 'package:flutter/material.dart';

import '../size_config.dart';

/// Define vertical or horizontal space between widgets.
class Space extends StatelessWidget {
  final double width;
  final double height;

  Space(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: responsiveWidth(width), height: responsiveHeight(height));
  }
}

/// Add vertical space
/// Type :
class VSpace extends StatelessWidget {
  final double size;

  const VSpace(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Space(0, size);

  static VSpace get spacing_2 => VSpace(2);
  static VSpace get spacing_3 => VSpace(3);
  static VSpace get spacing_5 => VSpace(5);
  static VSpace get spacing_6 => VSpace(6);
  static VSpace get spacing_7 => VSpace(7);
  static VSpace get spacing_8 => VSpace(8);
  static VSpace get spacing_9 => VSpace(9);
  static VSpace get spacing_10 => VSpace(10);
  static VSpace get spacing_11 => VSpace(11);
  static VSpace get spacing_12 => VSpace(12);
  static VSpace get spacing_13 => VSpace(13);
  static VSpace get spacing_14 => VSpace(14);
  static VSpace get spacing_15 => VSpace(15);
  static VSpace get spacing_16 => VSpace(16);
  static VSpace get spacing_17 => VSpace(17);
  static VSpace get spacing_18 => VSpace(18);
  static VSpace get spacing_19 => VSpace(19);
  static VSpace get spacing_20 => VSpace(20);
  static VSpace get spacing_25 => VSpace(25);
  static VSpace get spacing_30 => VSpace(30);
  static VSpace get spacing_35 => VSpace(35);
  static VSpace get spacing_40 => VSpace(40);

}

/// Add horizontal space
/// Type :
class HSpace extends StatelessWidget {
  final double size;

  const HSpace(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Space(size, 0);

  static HSpace get spacing_2 => HSpace(2);
  static HSpace get spacing_3 => HSpace(3);
  static HSpace get spacing_5 => HSpace(5);
  static HSpace get spacing_6 => HSpace(6);
  static HSpace get spacing_7 => HSpace(7);
  static HSpace get spacing_8 => HSpace(8);
  static HSpace get spacing_9 => HSpace(9);
  static HSpace get spacing_10 => HSpace(10);
  static HSpace get spacing_11 => HSpace(11);
  static HSpace get spacing_12 => HSpace(12);
  static HSpace get spacing_13 => HSpace(13);
  static HSpace get spacing_14 => HSpace(14);
  static HSpace get spacing_15 => HSpace(15);
  static HSpace get spacing_16 => HSpace(16);
  static HSpace get spacing_17 => HSpace(17);
  static HSpace get spacing_18 => HSpace(18);
  static HSpace get spacing_19 => HSpace(19);
  static HSpace get spacing_20 => HSpace(20);
  static HSpace get spacing_25 => HSpace(25);
  static HSpace get spacing_30 => HSpace(30);
  static HSpace get spacing_35 => HSpace(35);
  static HSpace get spacing_40 => HSpace(40);
}