import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../Theme/size_config.dart';
import '../../Theme/theme.dart';
import '../../Theme/typography.dart';

class FilterTypeTitle extends StatefulWidget {
  final List<String> listViewData;
  final void Function(String, int) callback1;
  final int globalSelectedIndex;

  const FilterTypeTitle(this.callback1, this.listViewData, this.globalSelectedIndex);

  @override
  AtmsBranchsFilterType createState() => AtmsBranchsFilterType();
}

class AtmsBranchsFilterType extends State<FilterTypeTitle> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 0.0),
      shrinkWrap: true,
      itemBuilder: (context, index) =>
          _getCardView(context, widget.listViewData[index], index),
      itemCount: widget.listViewData.length,
      scrollDirection: Axis.horizontal,
    );
  }

  Widget _getCardView(BuildContext context, String data, int index) {
    return Container(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  getCardItem(
                      data, 40.0, 60.0, context, "#FFFFFF", "#444344", index),
                ])));
  }

  getCardItem(String title, double height, double width, context, String hexacolor1,
      String textcolor1, int index) {
    return GestureDetector(
        onTap: () {
          setState(() {
            widget.callback1(title, index);
          });
        },
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            color: widget.globalSelectedIndex == index
                ? GainGermsTheme().getTheme().color6
                : GainGermsTheme().getTheme().color18,
            elevation: 3,
            child: Container(
                alignment: Alignment.center,
                height: responsiveWidth(30), 
                padding: EdgeInsets.only(
                    left: responsiveWidth(30.0), right: responsiveWidth(30.0), top: 0.0, bottom: 0.0),
                child: Text(title.toLowerCase().tr().toString(),
                    textAlign: TextAlign.center,
                    style: GainGermsText(
                                            typo: Typo.H7,    
                                            isBold: false,
                                            color: widget.globalSelectedIndex == index
                                            ? GainGermsTheme().getTheme().color18:GainGermsTheme().getTheme().headerColor)
                                        .style(),
                  ))));
  }
}
