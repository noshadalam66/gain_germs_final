import '../../Theme/theme.dart';
import '../../Models/user_details.dart';
import '../../screens/withdraw/index.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/constants.dart';
import '../../header/header.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../Models/commonmodel.dart';
import '../../helper/shared_preferences.dart';
import '../../routes/route_delegate.dart';
import '../../routes/route_handeler.dart';
class WithdrawalScreen extends StatefulWidget {

  const WithdrawalScreen({
    Key? key,
    required WithdrawBloc withdrawBloc,
  })  : _withdrawBloc = withdrawBloc,
        super(key: key);


  final WithdrawBloc _withdrawBloc;

  @override
  WithdrawalScreenState createState() {
    return WithdrawalScreenState();
  }
}



class WithdrawalScreenState extends State<WithdrawalScreen> {

  double myGainPrice = 0.1;
  double withdrawalAmount = 0.0;
  double totalGerms = 1.0;

  var _textController = TextEditingController();

  UserResponse? userResponse;
  bool isApiCall = true;
  bool showData = false;



  void _load(){
    widget._withdrawBloc.add(LoadWithdrawEvent());
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
    withdrawalAmount = totalGerms * myGainPrice;
    _textController.addListener((){
      //here you have the changes of your textfield
      print("value: ${_textController.text}");
      //use setState to rebuild the widget
      setState(() {
        String chlakdf = _textController.text.toString();
        int germs = int.parse(chlakdf);
        double gp = double.parse(userResponse?.customerData?.gainPrice ?? "0.0");
        withdrawalAmount = germs * gp;
      });
    });
    super.initState();
    _load();

    getBoolValuesSF(isLoggedIn).then((value) => {
      if (!value){AppRouterDelegate().setPathName(RouteData.login.name, loggedIn: false)}
    });
    // html.window.history.pushState({}, '', '/withdrawal');

  }
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return BlocConsumer<WithdrawBloc, WithdrawState>(
        bloc: widget._withdrawBloc,
        listener: (BuildContext context,
            WithdrawState currentState,) {
          if (currentState is UnWithdrawState) {
            isApiCall = true;
          }
          if (currentState is ErrorWithdrawState) {
            isApiCall = false;
            // errorHandling(currentState.errorMessage);
          }
          if (currentState is InWithdrawState) {
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
            WithdrawState currentState,) {
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
                  Container(
                    child: Text(
                      "Withdrawal",
                      style: headingOne(_size, Colors.white),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(height: defaultPadding * 1.2),
                  _size.width > 1100
                      ? getTopLayoutInFourColumn(_size)
                      : getTopLayoutInOneColumn(_size),
                  SizedBox(height: defaultPadding * 1.2),
                  _size.width > 1100
                      ? getMidLayoutInFourColumn(_size)
                      : getMidLayoutInOneColumn(_size),
                  SizedBox(height: defaultPadding * 1.2),
                  getWithdrawalHistory(_size),
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
    //         Container(
    //           child: Text(
    //             'withdrawal'.tr().toString(),
    //             style: headingOne(_size, Colors.white),
    //           ),
    //           alignment: Alignment.topLeft,
    //         ),
    //         SizedBox(height: defaultPadding * 1.2),
    //         _size.width > 1100
    //             ? getTopLayoutInFourColumn(_size)
    //             : getTopLayoutInOneColumn(_size),
    //         SizedBox(height: defaultPadding * 1.2),
    //         _size.width > 1100
    //             ? getMidLayoutInFourColumn(_size)
    //             : getMidLayoutInOneColumn(_size),
    //         SizedBox(height: defaultPadding * 1.2),
    //         getWithdrawalHistory(_size),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget getTopLayoutInFourColumn(Size size) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.payment, color: Colors.grey),
                  hintText: 'Payoneer',
                  enabled: false,
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
            ),
            SizedBox(width: defaultPadding),
            Flexible(
              flex: 3,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Colors.grey),
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
            ),
            SizedBox(width: defaultPadding),
            Flexible(
              flex: 2,
              child: TextField(
                controller: _textController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixText: "Germs" + ": ",
                  // prefixIcon: Icon(Icons, color: Colors.white),
                  hintText: '1',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
            ),
            SizedBox(width: defaultPadding),
            Flexible(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(
                  // prefixIcon: Icon(Icons.person, color: Colors.white),
                  hintText: "USD" + " " + "${withdrawalAmount}",
                  hintStyle: TextStyle(color: Colors.grey),
                  enabled: false,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
            ),
            SizedBox(width: defaultPadding),
            Flexible(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Fees" + ": 2%",
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
              child: Text("Withdraw"),
            ),
          ]),
    );
  }

  Widget getTopLayoutInOneColumn(Size size) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.payment, color: Colors.grey),
                hintText: 'Payoneer',
                enabled: false,
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
            SizedBox(height: defaultPadding),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email, color: Colors.grey),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
            SizedBox(height: defaultPadding),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                // prefixIcon: Icon(Icons.person, color: Colors.white),
                prefixText: "Germs" + " ",
                hintText: ' ',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
            SizedBox(height: defaultPadding),
            TextField(
              decoration: InputDecoration(
                // prefixIcon: Icon(Icons.person, color: Colors.white),
                hintText: "USD" + " ",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
            SizedBox(height: defaultPadding),
            TextField(
              decoration: InputDecoration(
                hintText: "Fees" + ": 2% ",
                // prefixIcon: Icon(Icons.person, color: Colors.white),
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
              child: Text("Withdraw"),
            ),
          ]),
    );
  }

  Widget getMidLayoutInFourColumn(Size size) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: getFirstLayout(size)),
          Container(
            child: Text("\n    \n\n\n\n\n"),
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Expanded(
              flex: 3,
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
          Expanded(flex: 3, child: getThirdLayout(size)),
          Container(
            child: Text("\n    \n\n\n\n\n"),
            decoration: BoxDecoration(
              color: GainGermsTheme().getTheme().backGroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
          ),
          Expanded(flex: 3, child: getFourLayout(size))
        ],
      ),
    );
  }

  Widget getMidLayoutInOneColumn(Size size) {
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
          getThirdLayout(size),
          SizedBox(
            height: defaultPadding,
            child: Container(
              decoration: BoxDecoration(
                  color: GainGermsTheme().getTheme().backGroundColor),
            ),
          ), //Expanded(flex: 8, child: getThirdLayout(size))
          getFourLayout(size),
        ],
      ),
    );
  }

  Widget getFirstLayout(Size size) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      // decoration: BoxDecoration(
      //   color: secondaryColor,
      //   borderRadius: const BorderRadius.all(Radius.circular(10)),
      // ),
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
          SizedBox(height: defaultPadding),
          Text(
            "${userResponse?.customerData?.withdrawnGains}" + " " + "Germs",
            textAlign: TextAlign.center,
            style: headingOne(size, Colors.white),
          ),
          SizedBox(height: defaultPadding / 1.5),
          Text(
            "Total Withdrawal",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.white,
                ),
          ),
          SizedBox(height: 6),
        ],
      ),
    );
  }

  Widget getSecondLayout(Size size) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      // decoration: BoxDecoration(
      //   color: secondaryColor,
      //   borderRadius: const BorderRadius.all(Radius.circular(10)),
      // ),
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
          SizedBox(height: defaultPadding),
          Text(
            "USD"+ " " + "${userResponse?.customerData?.totalWithdrawalsAmount}",
            textAlign: TextAlign.center,
            style: headingOne(size, Colors.white),
          ),
          SizedBox(height: defaultPadding / 1.5),
          Text(
            "Total Withdrawal",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.white,
                ),
          ),
          SizedBox(height: 6),
        ],
      ),
    );
  }

  Widget getThirdLayout(Size size) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      // decoration: BoxDecoration(
      //   color: secondaryColor,
      //   borderRadius: const BorderRadius.all(Radius.circular(10)),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(defaultPadding * 0.7),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Image.asset(
              "assets/images/roll.png",
              height: 28,
              color: Colors.red.withOpacity(0.9),
            ),
          ),
          SizedBox(height: defaultPadding),
          Text(
            "${userResponse?.customerData?.availableGains}" + " " + "Germs",
            textAlign: TextAlign.center,
            style: headingOne(size, Colors.white),
          ),
          SizedBox(height: defaultPadding / 1.5),
          Text(
            "Available Balance",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.white,
                ),
          ),
          SizedBox(height: 6),
        ],
      ),
    );
  }

  Widget getFourLayout(Size size) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      // decoration: BoxDecoration(
      //   color: secondaryColor,
      //   borderRadius: const BorderRadius.all(Radius.circular(10)),
      // ),
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
              "assets/images/watch.png",
              height: 28,
              color: Colors.cyan.withOpacity(0.9),
            ),
          ),
          SizedBox(height: defaultPadding),
          Text(
            "${userResponse?.customerData?.pendingGains}" + " " + "Germs",
            textAlign: TextAlign.center,
            style: headingOne(size, Colors.white),
          ),
          SizedBox(height: defaultPadding / 1.5),
          Text(
            "Pending Balance",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.white,
                ),
          ),
          SizedBox(height: 6),
        ],
      ),
    );
  }

  Widget getWithdrawalHistory(Size size) {
    List withdrawals = [];
    int limit = userResponse?.customerData?.withdrawls?.length ?? 0;
    for (int i = 0; i < limit; i++) {
      withdrawals.add(userResponse?.customerData?.withdrawls![i]);
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
              "Your Withdrawals",
              style: headingOne(size, Colors.white),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: MaterialStateColor.resolveWith((states) =>
                    GainGermsTheme().getTheme().backGroundColor.withOpacity(0.5)),
                columnSpacing: 40, //defaultPadding,
                // minWidth: 600,
                columns: [
                  DataColumn(
                    label: Text("Payment System",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text("Wallet Address",
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
                  withdrawals.length,
                  (index) =>
                      withdrawalDataRow(withdrawals[index], context, index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  DataRow withdrawalDataRow(
      Withdrawls withdrawl, BuildContext context, int index) {
    return DataRow(
      cells: [
        DataCell(
          Text(withdrawl.paymentMethod!,
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.white)),
        ),
        DataCell(
          Text(withdrawl.paymentToAccount!,
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.white)),
        ),
        DataCell(Text(withdrawl.withdrawAmount!,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.white))),
        DataCell(Text(withdrawl.withdrawStatus!,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.white))),
        DataCell(Text(withdrawl.withdrawDate!,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.white))),
      ],
    );
  }
}
