import 'package:flutter/material.dart';


import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Theme/theme.dart';
import '../constants/constants.dart';

class TermAndCondition extends StatefulWidget {
  _TermAndCondition createState() => _TermAndCondition();
}

class _TermAndCondition extends State<TermAndCondition> {

  bool apiCall = false;

  @override
  void initState() {
    super.initState();


  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: GainGermsTheme().getTheme().backGroundColor,
        resizeToAvoidBottomInset: false,
        body: ModalProgressHUD(
          inAsyncCall: apiCall,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  SizedBox(height: 40,),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, top: 5.0, right: 20.0, bottom: 5.0),
                    child: Text(
                      "Terms and Conditions",
                      style: kLoginTitleStyle(size, Colors.white),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.only(left: 24.0, top: 5.0, right: 24.0, bottom: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(
                        "1. Access to the Site",
                        style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                        // textAlign: TextAlign.center,
                      ),
                        Container(
                          margin: EdgeInsets.only(left: 24.0, top: 5.0, right: 24.0, bottom: 5.0),
                          child: Text(
                            "1.1 By accessing and using the Website, you agree to comply with these Terms and Conditions. If you do not agree with all the terms of use, please do not use the Website.",
                            style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24.0, top: 5.0, right: 24.0, bottom: 5.0),
                          child: Text(
                            "1.2 We reserve the right, at our sole discretion, to amend, modify or otherwise alter these Terms and Conditions at any time. These amendments and/or modifications shall be effective immediately upon posting on the Site. We encourage you to periodically review the terms of use, because use the Site for some time after the publication of the changes will mean that you agree with all of the revised terms of use.",
                            style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24.0, top: 5.0, right: 24.0, bottom: 5.0),
                          child: Text(
                              "1.3 The management is committed to: Maintain the confidentiality of information provided by the user during registration.\n",
                            style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          "2. Terms of use for users",
                          style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                          // textAlign: TextAlign.center,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24.0, top: 5.0, right: 24.0, bottom: 5.0),
                          child: Text(
                              "2.1 The User shall be a physical or legal person registered in GainGerms system.",
                            style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24.0, top: 5.0, right: 24.0, bottom: 5.0),
                          child: Text(
                              "2.2 The user has the right to refuse use of the system by writing the appropriate support request.",
                            style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24.0, top: 5.0, right: 24.0, bottom: 5.0),
                          child: Text(
                              "2.3 Administrators GainGerms network has the right to refuse to co-operation with the user without explaining the reasons. All funds will be blocked and returned to the original owners.",
                            style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24.0, top: 5.0, right: 24.0, bottom: 5.0),
                          child: Text(
                              "2.4 The User is prohibited from:\n" +
                                  "\t\t-\tUse VPN, proxy, tor browser and other tools with hiding your real data.\n" +
                                  "\t\t-\tScrewing referrals\n" +
                                  "\t\t-\tInsult administration\n" +
                                  "\t\t-\tAny attempt to fraud the system\n" +
                                  "\t\t-\tManipulation of content ad units\n" +
                                  "\t\t-\tUse spam to attract new participants to the system\n" +
                                  "\t\t-\tMotivated referrals\n" +
                                  "\t\t-\tCreate multiple accounts in the system\n" +
                                  "\t\t-\tUse this Website in any way that is or may be damaging to this Website or other visitors\n" +
                                  "\t\t-\tUse this Website in any way that impacts visitor access to this Website\n" +
                                  "\t\t-\tEngaging in any data mining, data harvesting, data extracting or any other similar activity in relation to this Website",
                            style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24.0, top: 5.0, right: 24.0, bottom: 5.0),
                          child: Text(
                            "2.5 The Company does not guarantee the absolute continuity of the service.\n",
                            style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24.0, top: 5.0, right: 24.0, bottom: 5.0),
                          child: Text(
                            "2.6 Price of Germs may fluctuate as per market value .\n",
                            style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                            "3. The Website responsibility",
                          style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                          // textAlign: TextAlign.center,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24.0, top: 5.0, right: 24.0, bottom: 5.0),
                          child: Text(
                              "3.1 Your Content means video YouTube or other material you choose to display on this Website. By displaying Your Content, you grant the Website a non-exclusive, worldwide irrevocable, sub licensable license to use, reproduce, adapt, publish, translate and distribute it in any and all media.",
                            style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24.0, top: 5.0, right: 24.0, bottom: 5.0),
                          child: Text(
                              "3.2 The Website does not accept monetary deposits and does not require for any payments in any currency.",
                            style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24.0, top: 5.0, right: 24.0, bottom: 5.0),
                          child: Text(
                              "3.3 This Website is not associated with any trademark. The Website and/or its licensors own all the intellectual property rights and materials contained in this Website, except for any third party logotypes, names and other copyrighted material.",
                            style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24.0, top: 5.0, right: 24.0, bottom: 5.0),
                          child: Text(
                            "3.4 In no event shall the Website, nor any of its officers, directors and employees, be held liable for anything arising out of or in any way connected with your use of this Website whether such liability is under contract. The Website, including its officers, directors and employees shall not be held liable for any indirect, consequential or special liability arising out of or in any way related to your use of this Website.",
                            style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                    ),
                  ),

                ],),
              );
            },
          ),
        ),
      ),
    );
  }
}
