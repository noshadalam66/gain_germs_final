import '../../Theme/theme.dart';
import '../../screens/faq/faq_bloc.dart';
import '../../screens/faq/faq_event.dart';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/constants.dart';
import '../../header/header.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../Models/commonmodel.dart';
import '../../Models/user_details.dart';
import '../../helper/shared_preferences.dart';
import 'faq_state.dart';
import '../../routes/route_delegate.dart';
import '../../routes/route_handeler.dart';
class FAQScreen extends StatefulWidget {

  const FAQScreen({
    Key? key,
    required FaqBloc faqBloc,
  })  : _faqBloc = faqBloc,
        super(key: key);


  final FaqBloc _faqBloc;

  @override
  FAQScreenState createState() {
    return FAQScreenState();
  }
}


class FAQScreenState extends State<FAQScreen> {

  UserResponse? userResponse;
  bool isApiCall = true;
  bool showData = false;

  @override
  initState() {
    super.initState();
    _load();

    getBoolValuesSF(isLoggedIn).then((value) => {
      if (!value){AppRouterDelegate().setPathName(RouteData.login.name, loggedIn: false)}
    });
    // html.window.history.pushState({}, '', '/faq');
  }

  void _load(){
    widget._faqBloc.add(LoadFaqEvent());
  }

  void setValue(UserResponse ur, bool sd){
    setUserDetail(ur);
    userResponse = ur;
    isApiCall = false;
    showData = sd;
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return BlocConsumer<FaqBloc, FaqState>(
        bloc: widget._faqBloc,
        listener: (BuildContext context,
            FaqState currentState,) {
          if (currentState is UnFaqState) {
            isApiCall = true;
          }
          if (currentState is ErrorFaqState) {
            isApiCall = false;
            // errorHandling(currentState.errorMessage);
          }
          if (currentState is InFaqState) {
            isApiCall = false;
          }
          if (currentState is ApiCardsCallBack) {
            userResponse = currentState.userResponse;
            if(userResponse?.customerData == null){
              getCDFromSF().then((value) => {
                setValue(value!, currentState.showData)
              });
            }else{
              isApiCall = false;
              showData = currentState.showData;
            }
            print("userResponse - ${userResponse}");
          }
        },
        builder: (BuildContext context,
            FaqState currentState,) {
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
                      "FAQ",
                      style: headingOne(_size, Colors.white),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(height: defaultPadding * 1.2),
                  getFAQ(),
                ],
              ),
            ),
          );
        });
  }

  Widget getFAQ(){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: defaultPadding, right: defaultPadding),
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: GainGermsTheme().getTheme().layoutColor.withOpacity(0.9),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              iconColor: Colors.white,
              tapBodyToCollapse: true,
            ),
            header: Text(
              "Q. What is a GainGerms?",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              "GainGerms is a cryptocurrency. The high speed of transactions is a main feature of GainGerms. Cryptocurrencies are implemented on early blockchain platforms due to the low speed of transactions. They are more suitable for investments than for the usage as a payment tool. For instance, Bitcoin can provide only 7 transactions per second for all users while Ethereum can provide only 15. The GainGerms blockchain platform is expected to process millions of transactions per second. It should become a crypto-analog of Visa and MasterCard.",
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              "GainGerms is a cryptocurrency. The high speed of transactions is a main feature of GainGerms. Cryptocurrencies are implemented on early blockchain platforms due to the low speed of transactions. They are more suitable for investments than for the usage as a payment tool. For instance, Bitcoin can provide only 7 transactions per second for all users while Ethereum can provide only 15. The GainGerms blockchain platform is expected to process millions of transactions per second. It should become a crypto-analog of Visa and MasterCard.",
              softWrap: true,
            ),
          ),
        ),
        SizedBox(height: defaultPadding * 0.2),
        Container(
          margin: EdgeInsets.only(left: defaultPadding, top: defaultPadding, right: defaultPadding),
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: GainGermsTheme().getTheme().layoutColor.withOpacity(0.9),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              iconColor: Colors.white,
              tapBodyToCollapse: true,
            ),
            header: Text(
              "Q. Why are they free?",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              "10% of the GainGerms mass allocated to a nonprofit organization that maintains the operating capacity of the infrastructure.",
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              "10% of the GainGerms mass allocated to a nonprofit organization that maintains the operating capacity of the infrastructure.",
              softWrap: true,
            ),
          ),
        ),
        SizedBox(height: defaultPadding * 0.2),
        Container(
          margin: EdgeInsets.only(left: defaultPadding, top: defaultPadding, right: defaultPadding),
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: GainGermsTheme().getTheme().layoutColor.withOpacity(0.9),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              iconColor: Colors.white,
              tapBodyToCollapse: true,
            ),
            header: Text(
              "Q. How does the lottery work?",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              "There are 10000 tickets on each tour. The probability of winning one ticket is 0.1%. Every day a random number occurs with the ticket number of the winner. The prize is calculated based on the table of winnings.",
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              "There are 10000 tickets on each tour. The probability of winning one ticket is 0.1%. Every day a random number occurs with the ticket number of the winner. The prize is calculated based on the table of winnings.",
              softWrap: true,
            ),
          ),
        ),
        SizedBox(height: defaultPadding * 0.2),
        Container(
          margin: EdgeInsets.only(left: defaultPadding, top: defaultPadding, right: defaultPadding),
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: GainGermsTheme().getTheme().layoutColor.withOpacity(0.9),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              iconColor: Colors.white,
              tapBodyToCollapse: true,
            ),
            header: Text(
              "Q. What is a User level?",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              "There is an indicator of the user activity on the site that helps to identify real users from bots that automatically try to trick the system. When you reach a new level, you get bonuses.",
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              "There is an indicator of the user activity on the site that helps to identify real users from bots that automatically try to trick the system. When you reach a new level, you get bonuses.",
              softWrap: true,
            ),
          ),
        ),
        SizedBox(height: defaultPadding * 0.2),
        Container(
          margin: EdgeInsets.only(left: defaultPadding, top: defaultPadding, right: defaultPadding),
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: GainGermsTheme().getTheme().layoutColor.withOpacity(0.9),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              iconColor: Colors.white,
              tapBodyToCollapse: true,
            ),
            header: Text(
              "Q. The roll rime has increased. Why?",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              "You have reached the daily limit.",
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              "You have reached the daily limit.",
              softWrap: true,
            ),
          ),
        ),
        SizedBox(height: defaultPadding * 0.2),
        Container(
          margin: EdgeInsets.only(left: defaultPadding, top: defaultPadding, right: defaultPadding),
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: GainGermsTheme().getTheme().layoutColor.withOpacity(0.9),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              iconColor: Colors.white,
              tapBodyToCollapse: true,
            ),
            header: Text(
              "Q. I have uploaded a new video. How long does it take to moderate it?",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              "Overall, it depends on the moderation queue. Some videos are moderated by the neural network immediately, some are sent for a manual review so you'll need to wait for a few days.",
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              "Overall, it depends on the moderation queue. Some videos are moderated by the neural network immediately, some are sent for a manual review so you'll need to wait for a few days.",
              softWrap: true,
            ),
          ),
        ),
        SizedBox(height: defaultPadding * 0.2),
        Container(
          margin: EdgeInsets.only(left: defaultPadding, top: defaultPadding, right: defaultPadding),
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: GainGermsTheme().getTheme().layoutColor.withOpacity(0.9),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              iconColor: Colors.white,
              tapBodyToCollapse: true,
            ),
            header: Text(
              "Q. What is a smart contract?",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              "A smart contract is a computer protocol intended to digitally facilitate, verify, or enforce the negotiation or performance of a contract. Smart contracts allow the performance of credible transactions without third parties. These transactions are trackable and irreversible. The goal of smart contracts is to provide security that is superior to traditional contract law and to reduce other transaction costs associated with contracting. Various cryptocurrencies have implemented types of smart contracts.",
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              "A smart contract is a computer protocol intended to digitally facilitate, verify, or enforce the negotiation or performance of a contract. Smart contracts allow the performance of credible transactions without third parties. These transactions are trackable and irreversible. The goal of smart contracts is to provide security that is superior to traditional contract law and to reduce other transaction costs associated with contracting. Various cryptocurrencies have implemented types of smart contracts.",
              softWrap: true,
            ),
          ),
        ),
        SizedBox(height: defaultPadding * 0.2),
        Container(
          margin: EdgeInsets.only(left: defaultPadding, top: defaultPadding, right: defaultPadding),
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: GainGermsTheme().getTheme().layoutColor.withOpacity(0.9),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              iconColor: Colors.white,
              tapBodyToCollapse: true,
            ),
            header: Text(
              "Q. What does a risky contract mean?",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              "It means that this contract has to be confirmed every day; otherwise you will have to pay a penalty. As an example, if you have a contract on the 10th day, you need to confirm it on the 11th, 12th, 13th, 14th day and sign it on the 15th day. You can skip days with a regular contract and sign it during 2 months after its completion.",
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              "It means that this contract has to be confirmed every day; otherwise you will have to pay a penalty. As an example, if you have a contract on the 10th day, you need to confirm it on the 11th, 12th, 13th, 14th day and sign it on the 15th day. You can skip days with a regular contract and sign it during 2 months after its completion.",
              softWrap: true,
            ),
          ),
        ),
        SizedBox(height: defaultPadding * 0.2),
        Container(
          margin: EdgeInsets.only(left: defaultPadding, top: defaultPadding, right: defaultPadding),
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: GainGermsTheme().getTheme().layoutColor.withOpacity(0.9),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              iconColor: Colors.white,
              tapBodyToCollapse: true,
            ),
            header: Text(
              "Q. How can I delete my account?",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              "To delete your account, press the button:",
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              "To delete your account, press the button:",
              softWrap: true,
            ),
          ),
        ),
        SizedBox(height: defaultPadding * 0.2),
        Container(
          margin: EdgeInsets.only(left: defaultPadding, top: defaultPadding, right: defaultPadding),
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: GainGermsTheme().getTheme().layoutColor.withOpacity(0.9),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              iconColor: Colors.white,
              tapBodyToCollapse: true,
            ),
            header: Text(
              "Q. Why is my Available balance less than the Balance on dashboard?",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              "Due to the frequent fraudulent activities, we had to add a deferred payment (payment delay or payment of remuneration). GainGerms, will be transferred from the Pending balance to the Available balance as soon as your referral reaches level 2.",
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              "Due to the frequent fraudulent activities, we had to add a deferred payment (payment delay or payment of remuneration). GainGerms, will be transferred from the Pending balance to the Available balance as soon as your referral reaches level 2.",
              softWrap: true,
            ),
          ),
        ),
        SizedBox(height: defaultPadding * 0.2),
        Container(
          margin: EdgeInsets.only(left: defaultPadding, top: defaultPadding, right: defaultPadding),
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: GainGermsTheme().getTheme().layoutColor.withOpacity(0.9),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              iconColor: Colors.white,
              tapBodyToCollapse: true,
            ),
            header: Text(
              "Q. What is the minimum withdrawal?",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              "Today it is 5000 GainGerms.",
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              "Today it is 5000 GainGerms.",
              softWrap: true,
            ),
          ),
        ),
        SizedBox(height: defaultPadding * 0.2),
        Container(
          margin: EdgeInsets.only(left: defaultPadding, top: defaultPadding, right: defaultPadding),
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: GainGermsTheme().getTheme().layoutColor.withOpacity(0.9),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              iconColor: Colors.white,
              tapBodyToCollapse: true,
            ),
            header: Text(
              "Q. When do I get money to my card?",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              "You will get the money as soon as our moderator is ready with your account check. Usually within two weeks, but in some cases it may take longer. You don't need to pay anything. If you use an e-wallet, you'll get the money immediately, but you'll need to wait a couple of days if you have VISA or MasterCard.",
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              "You will get the money as soon as our moderator is ready with your account check. Usually within two weeks, but in some cases it may take longer. You don't need to pay anything. If you use an e-wallet, you'll get the money immediately, but you'll need to wait a couple of days if you have VISA or MasterCard.",
              softWrap: true,
            ),
          ),
        ),
        SizedBox(height: defaultPadding * 0.2),
        Container(
          margin: EdgeInsets.only(left: defaultPadding, top: defaultPadding, right: defaultPadding),
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: GainGermsTheme().getTheme().layoutColor.withOpacity(0.9),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              iconColor: Colors.white,
              tapBodyToCollapse: true,
            ),
            header: Text(
              "Q. Suspicious activity, what is it?",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              "1. Using third-party programs\n2. Using scripts that automate actions on the site\n3. Attempts to cheat the system\n Your account has been sent for review. Do not break the rules of the site and the blocking will be removed in a few days.\n",
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              "1. Using third-party programs\n2. Using scripts that automate actions on the site\n3. Attempts to cheat the system\n Your account has been sent for review. Do not break the rules of the site and the blocking will be removed in a few days.\n",
              softWrap: true,
            ),
          ),
        ),
        SizedBox(height: defaultPadding * 0.2),
        Container(
          margin: EdgeInsets.only(left: defaultPadding, top: defaultPadding, right: defaultPadding),
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: GainGermsTheme().getTheme().layoutColor.withOpacity(0.9),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              iconColor: Colors.white,
              tapBodyToCollapse: true,
            ),
            header: Text(
              "Q. Suspicious activity on your referral link, what is it?",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              "Many users try to cheat on our website and register a lot of accounts. These actions are prohibited. Some people are engaged in spamming and send their referral links wherever it is possible. That is why we had to make some restrictions on acquiring new referrals. If you have a large audience, send us a message to support with a detailed description of how you are going to acquire new referrals.",
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              "Many users try to cheat on our website and register a lot of accounts. These actions are prohibited. Some people are engaged in spamming and send their referral links wherever it is possible. That is why we had to make some restrictions on acquiring new referrals. If you have a large audience, send us a message to support with a detailed description of how you are going to acquire new referrals.",
              softWrap: true,
            ),
          ),
        ),
        SizedBox(height: defaultPadding * 0.2),
        Container(
          margin: EdgeInsets.only(left: defaultPadding, top: defaultPadding, right: defaultPadding),
          padding: EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: GainGermsTheme().getTheme().layoutColor.withOpacity(0.9),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              iconColor: Colors.white,
              tapBodyToCollapse: true,
            ),
            header: Text(
              "Q. Can I register multiple accounts?",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              "No, this is strictly prohibited by the rules. You can read the Terms and Conditions here.",
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              "No, this is strictly prohibited by the rules. You can read the Terms and Conditions here.",
              softWrap: true,
            ),
          ),
        ),
      ],
    );
  }
}
