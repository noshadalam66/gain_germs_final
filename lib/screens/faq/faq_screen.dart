import '../../Theme/theme.dart';
import '../../screens/faq/faq_bloc.dart';
import '../../screens/faq/faq_event.dart';
import 'package:easy_localization/easy_localization.dart';
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
                      'faq'.tr().toString(),
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
              'question_one'.tr().toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              'ans_one'.tr().toString(),
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              'ans_one'.tr().toString(),
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
              'question_two'.tr().toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              'ans_two'.tr().toString(),
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              'ans_two'.tr().toString(),
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
              'question_three'.tr().toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              'ans_three'.tr().toString(),
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              'ans_three'.tr().toString(),
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
              'question_four'.tr().toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              'ans_four'.tr().toString(),
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              'ans_four'.tr().toString(),
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
              'question_five'.tr().toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              'ans_five'.tr().toString(),
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              'ans_five'.tr().toString(),
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
              'question_six'.tr().toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              'ans_six'.tr().toString(),
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              'ans_six'.tr().toString(),
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
              'question_seven'.tr().toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              'ans_seven'.tr().toString(),
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              'ans_seven'.tr().toString(),
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
              'question_eight'.tr().toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              'ans_eight'.tr().toString(),
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              'ans_eight'.tr().toString(),
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
              'question_nine'.tr().toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              'ans_nine'.tr().toString(),
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              'ans_nine'.tr().toString(),
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
              'question_ten'.tr().toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              'ans_ten'.tr().toString(),
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              'ans_ten'.tr().toString(),
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
              'question_eleven'.tr().toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              'ans_eleven'.tr().toString(),
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              'ans_eleven'.tr().toString(),
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
              'question_twelve'.tr().toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              'ans_twelve'.tr().toString(),
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              'ans_twelve'.tr().toString(),
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
              'question_thirteen'.tr().toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              'ans_thirteen'.tr().toString(),
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              'ans_thirteen'.tr().toString(),
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
              'question_fourteen'.tr().toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              'ans_fourteen'.tr().toString(),
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              'ans_fourteen'.tr().toString(),
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
              'question_fifteen'.tr().toString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            collapsed: Text(
              'ans_fifteen'.tr().toString(),
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            expanded: Text(
              'ans_fifteen'.tr().toString(),
              softWrap: true,
            ),
          ),
        ),
      ],
    );
  }
}
