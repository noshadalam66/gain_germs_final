import '../../Theme/theme.dart';
import '../../Models/user_details.dart';
import '../../screens/deposit/deposit_bloc.dart';
import '../../screens/deposit/deposit_event.dart';
import '../../screens/deposit/deposit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/constants.dart';
import '../../header/header.dart';

import 'package:flutter/cupertino.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../routes/route_delegate.dart';
import '../../routes/route_handeler.dart';
import '../../Models//commonmodel.dart';
import '../../helper/shared_preferences.dart';
import '../../util/routes.dart';
// import 'package:get/get.dart';

class DepositScreen extends StatefulWidget {

  const DepositScreen({
    Key? key,
    required DepositBloc depositBloc,
  })  : _depositBloc = depositBloc,
        super(key: key);


  final DepositBloc _depositBloc;

  @override
  DepositScreenState createState() {
    return DepositScreenState();
  }
}


class DepositScreenState extends State<DepositScreen> {

  UserResponse? userResponse;
  bool isApiCall = true;
  bool showData = false;

  double myGainPrice = 0.1;//double.parse(userResponse?.customerData?.gainPrice ?? "0.0");

  double totalGerms = 1.0;
  var _textController = TextEditingController();


  void _load(){
    widget._depositBloc.add(LoadDepositEvent());
  }

  void setValue(UserResponse ur, bool sd){
    setUserDetail(ur);
    userResponse = ur;
    myGainPrice = double.parse(userResponse?.customerData?.gainPrice ?? "0.0");
    isApiCall = false;
    showData = sd;
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    totalGerms = 1.0 / myGainPrice;
    _textController.addListener((){
      //here you have the changes of your textfield
      print("value: ${_textController.text}");
      //use setState to rebuild the widget
      setState(() {
        String chlakdf = _textController.text.toString();
        int amount = int.parse(chlakdf);
        double gp = double.parse(userResponse?.customerData?.gainPrice ?? "0.0");
        totalGerms = amount / gp;
      });
    });
    super.initState();
    _load();

    getBoolValuesSF(isLoggedIn).then((value) => {
      if (!value){AppRouterDelegate().setPathName(RouteData.login.name, loggedIn: false)}
    });
    // html.window.history.pushState({}, '', '/deposit');
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return BlocConsumer<DepositBloc, DepositState>(
        bloc: widget._depositBloc,
        listener: (BuildContext context,
            DepositState currentState,) {
          if (currentState is UnDepositState) {
            isApiCall = true;
          }
          if (currentState is ErrorDepositState) {
            isApiCall = false;
            // errorHandling(currentState.errorMessage);
          }
          if (currentState is InDepositState) {
            isApiCall = false;
          }
          if (currentState is ApiCardsCallBack) {
            userResponse = currentState.userResponse;
            if(userResponse?.customerData == null){
              getCDFromSF().then((value) => {
                setValue(value!, currentState.showData)
              });
            }else{
              myGainPrice = double.parse(userResponse?.customerData?.gainPrice ?? "0.0");
              isApiCall = false;
              showData = currentState.showData;
            }
            print("userResponse - ${userResponse}");
          }
        },
        builder: (BuildContext context,
            DepositState currentState,) {
          return ModalProgressHUD(
            opacity: 0.3,
            color: Colors.grey,
            progressIndicator: CircularProgressIndicator(),
            dismissible: false,
            inAsyncCall: isApiCall,
            child: SingleChildScrollView(
              primary: false,
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  Header(userResponse: userResponse),
                  SizedBox(height: defaultPadding * 1.5),
                  Container(child: Text(
                    "Deposits",
                    style: headingOne(_size, Colors.white),
                  ), alignment: Alignment.topLeft,),
                  SizedBox(height: defaultPadding * 1.2),
                  _size.width > 1300
                      ? getThreeColumn(_size)
                      : _size.width < 1300 && _size.width > 800
                      ? getTwoColumn(_size)
                      : getOneColumn(_size),
                  SizedBox(height: defaultPadding * 1.2),
                  getDepositHistory(_size),
                ],
              ),
            ),
          );
        });
    // return SafeArea(
    //   child: SingleChildScrollView(
    //     primary: false,
    //     padding: EdgeInsets.all(defaultPadding),
    //     child: Column(
    //       children: [
    //         Header(),
    //         SizedBox(height: defaultPadding * 1.5),
    //         Container(child: Text(
    //           "Deposits",
    //           style: headingOne(_size, Colors.white),
    //         ), alignment: Alignment.topLeft,),
    //         SizedBox(height: defaultPadding * 1.2),
    //         _size.width > 1300
    //             ? getThreeColumn(_size)
    //             : _size.width < 1300 && _size.width > 800
    //                 ? getTwoColumn(_size)
    //                 : getOneColumn(_size),
    //         SizedBox(height: defaultPadding * 1.2),
    //         getDepositHistory(_size),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget getThreeColumn(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 10, child: getFirstLayout(size)),
          Container(
            child: Text("\n    \n\n\n\n\n"),
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: getSecondLayout(size),
              )),
          Container(
            child: Text("\n    \n\n\n\n\n"),
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
          ),
          Expanded(flex: 4, child: getThirdLayout(size))
        ],
      ),
    );
  }

  Widget getTwoColumn(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          getFirstLayout(size),
          SizedBox(
            height: defaultPadding,
            child: Container(
              decoration: BoxDecoration(
                  color: GainGermsTheme().getTheme().backGroundColor),
            ),
          ),
          Row(
            children: [
              Expanded(flex: 5, child: getSecondLayout(size)),
              Container(
                child: Text("\n    \n\n\n\n\n"),
                decoration: BoxDecoration(
                  color: GainGermsTheme().getTheme().backGroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: getThirdLayout(size),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget getOneColumn(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          getFirstLayout(size),
          SizedBox(
            height: defaultPadding,
            child: Container(
              decoration: BoxDecoration(
                  color: GainGermsTheme().getTheme().backGroundColor),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: getSecondLayout(size),
          ),
          SizedBox(
            height: defaultPadding,
            child: Container(
              decoration: BoxDecoration(
                  color: GainGermsTheme().getTheme().backGroundColor),
            ),
          ),
          getThirdLayout(size),//Expanded(flex: 8, child: getThirdLayout(size))
        ],
      ),
    );
  }

  Widget getFirstLayout(Size size) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(defaultPadding * 0.65),
            child: Text(
              "Amount",
              style: headingOne(size, Colors.white),
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          size.width > 700 ?
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _textController,
                    decoration: InputDecoration(
                      prefixText: "\$" + " ",
                      hintText: "1",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),

                    ),
                  ),
                ),
                SizedBox(width: defaultPadding),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Germs" + ": " + "${totalGerms}",
                      enabled: false,
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: defaultPadding),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: defaultPadding*2, top: defaultPadding, right: defaultPadding*2, bottom: defaultPadding)),
                    backgroundColor: MaterialStateProperty.all(
                        GainGermsTheme().getTheme().buttonColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultPadding/2),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    // if (_formKey.currentState!.validate()) {
                    //
                    // }
                  },
                  child: Text("Deposit!"),
                ),
              ]) :
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _textController,
                  decoration: InputDecoration(
                    prefixText: "\$" + " ",
                    hintText: "1",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),

                  ),
                ),
                SizedBox(height: defaultPadding),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Germs" + ": " + "${totalGerms}",
                    enabled: false,
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                ),
                SizedBox(height: defaultPadding),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: defaultPadding*2, top: defaultPadding, right: defaultPadding*2, bottom: defaultPadding)),
                    backgroundColor: MaterialStateProperty.all(
                        GainGermsTheme().getTheme().buttonColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultPadding/2),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    // if (_formKey.currentState!.validate()) {
                    //
                    // }
                  },
                  child: Text("Deposit!"),
                ),
              ]),
          // Icon(Icons.more_vert, color: Colors.white54)
        ],
      ),
    );
  }

  Widget getSecondLayout(Size size) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(defaultPadding * 0.7),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Image.asset(
              "assets/images/card.png",
              height: 28,
              color: primaryColor.withOpacity(0.9),
            ),
          ),
          SizedBox(height: defaultPadding / 2),
          Text(
            "\$" + " " + "${userResponse?.customerData?.depositedGains}",
            textAlign: TextAlign.center,
            style: headingOne(size, Colors.white),
          ),
          SizedBox(height: defaultPadding / 2),
          Text(
            "Total Deposit",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }

  Widget getThirdLayout(Size size) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(defaultPadding * 0.7),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.cyan.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Image.asset(
              "assets/images/smart_contract.png",
              height: 28,
              color: Colors.cyan.withOpacity(0.9),
            ),
          ),
          SizedBox(height: defaultPadding / 2),
          Text(
            "${userResponse?.customerData?.totalOperations}",
            textAlign: TextAlign.center,
            style: headingOne(size, Colors.white),
          ),
          SizedBox(height: defaultPadding / 2),
          Text(
            "Total Operations",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }

  Widget getDepositHistory(Size size){

    List deposits = [];
    int limit = userResponse?.customerData?.deposits?.length ?? 0;
    for (int i = 0; i < limit; i++) {
      deposits.add(userResponse?.customerData?.deposits![i]);
    }

    return Container(
      // color: GainGermsTheme().getTheme().backGroundColor.withOpacity(0.9),
      // padding: EdgeInsets.all(defaultPadding),
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
              "Deposit History",
              style: headingOne(size, Colors.white),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor:
                MaterialStateColor.resolveWith((states) => GainGermsTheme().getTheme().backGroundColor.withOpacity(0.5)),
                columnSpacing: 40, //defaultPadding,
                columns: [
                  DataColumn(
                    label: Text("Payment System",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text("Amount",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text("Status",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text("Date",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
                rows: List.generate(
                  deposits.length,
                      (index) => recentFileDataRow(deposits[index], context, index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow recentFileDataRow(Deposits deposit, BuildContext context, int index) {
    return DataRow(
      cells: [
        DataCell(Text(deposit.transactionId!,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.white)),
        ),
        DataCell( Text(deposit.depositAmount!,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.white)),

        ),
        DataCell(Text(deposit.depositCurrency!,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.white))),
        DataCell(Text(deposit.depositTime!,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.white))),
      ],
    );
  }
}
