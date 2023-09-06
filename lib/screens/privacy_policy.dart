import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../Theme/theme.dart';
import '../constants/constants.dart';

class PrivacyPolicy extends StatefulWidget {
  _PrivacyPolicy createState() => _PrivacyPolicy();
}

class _PrivacyPolicy extends State<PrivacyPolicy> {
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
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 10.0, top: 5.0, right: 20.0, bottom: 5.0),
                      child: Text(
                        'privacy_policy'.tr().toString(),
                        style: kLoginTitleStyle(size, Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 24.0, top: 5.0, right: 24.0, bottom: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Last updated: April 01, 2023\n\n",
                            style:
                                kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Text(
                            "This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.",
                            style:
                                kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Text(
                            "We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy.\n",
                            style:
                                kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Text(
                            "Interpretation and Definitions\n",
                            style: headingZero(size, Colors.white),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "Interpretation",
                            style: headingOne(size, Colors.white),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.\n",
                            style:
                                kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Text(
                            "Definitions",
                            style: headingOne(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Text(
                            "For the purposes of this Privacy Policy\n",
                            style:
                                kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "",
                                  style: headingTwo(size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "- Account " + "means a unique account created for You to access our Service or parts of our Service.",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "",
                                  style: headingTwo(size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "- Affiliate means an entity that controls, is controlled by or is under common control with a party, where &quot;control&quot; means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "",
                                  style: headingTwo(size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "- Company (referred to as either &quot;the Company&quot;, &quot;We&quot;, &quot;Us&quot; or &quot;Our&quot; in this Agreement) refers to GainGerms.",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "",
                                  style: headingTwo(size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "- Cookies are small files that are placed on Your computer, mobile device or any other device by a website, containing the details of Your browsing history on that website among its many uses.",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "",
                                  style: headingTwo(size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "- Country refers to:  Qatar",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "",
                                  style: headingTwo(size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "- Device means any device that can access the Service such as a computer, a cellphone or a digital tablet.",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "",
                                  style: headingTwo(size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "- Personal Data is any information that relates to an identified or identifiable individual.",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "",
                                  style: headingTwo(size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "- Service refers to the Website.",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "",
                                  style: headingTwo(size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "- Service Provider means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "",
                                  style: headingTwo(size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "- Usage Data refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "",
                                  style: headingTwo(size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "- Website refers to GainGerms, accessible from https://gaingerms.com/",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "",
                                  style: headingTwo(size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "- You means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.\n\n",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Collecting and Using Your Personal Data\n",
                            style: headingZero(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Text(
                            "Types of Data Collected\n",
                            style: headingOne(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Text(
                            "Personal Data\n",
                            style: headingTwo(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Text(
                            "While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:",
                            style:
                                kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Text(
                            " - Email ",
                            style:
                                kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Text(
                            " - Password ",
                            style:
                                kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Text(
                            " - Contact Number ",
                            style:
                                kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Text(
                            " - Gender ",
                            style:
                                kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Text(
                            " - Date of Birth\n\n",
                            style:
                                kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Text(
                            "Usage Data",
                            style: headingOne(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Text(
                            "Usage Data is collected automatically when using the Service.\n",
                            style:
                                kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Text(
                            "Tracking Technologies and Cookies",
                            style: headingOne(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Text(
                            "We use Cookies and similar tracking technologies to track the activity on Our Service and store certain information. Tracking technologies used are beacons, tags, and scripts to collect and track information and to improve and analyze Our Service. The technologies We use may include:\n",
                            style:
                                kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Text(
                            "Cookies or Browser Cookies ",
                            style: headingTwo(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "A cookie is a small file placed on Your Device. You can instruct Your browser to refuse all Cookies or to indicate when a Cookie is being sent. However, if You do not accept Cookies, You may not be able to use some parts of our Service. Unless you have adjusted Your browser setting so that it will refuse Cookies, our Service may use Cookies.\n",
                              style: kLoginTermsAndPrivacyStyle(
                                  size, Colors.white),
                              // textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            "Cookies can be &quot;Persistent&quot; or &quot;Session&quot; Cookies. Persistent Cookies remain on Your personal computer or mobile device when You go offline, while Session Cookies are deleted as soon as You close Your web browser.\n",
                            style:
                                kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Text(
                            "We use both Session and Persistent Cookies for the purposes set out below:\n",
                            style:
                                kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Text(
                            "Necessary / Essential Cookies ",
                            style: headingTwo(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Type: Session Cookies.",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Administered by: Us",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Purpose: These Cookies are essential to provide You with services available through the Website and to enable You to use some of its features. They help to authenticate users and prevent fraudulent use of user accounts. Without these Cookies, the services that You have asked for cannot be provided, and We only use these Cookies to provide You with those services.\n",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Functionality Cookies",
                            style: headingTwo(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Type: Persistent Cookies",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Administered by: Us",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                                Text(
                                  "Purpose: These Cookies allow us to remember choices You make when You use the Website, such as remembering your login details or language preference. The purpose of these Cookies is to provide You with a more personal experience and to avoid You having to re-enter your preferences every time You use the Website.\n",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "For more information about the cookies we use and your choices regarding cookies, please visit our Cookies Policy or the Cookies section of our Privacy Policy.\n",
                            style:
                                kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Text(
                            "Use of Your Personal Data.\n",
                            style: headingZero(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Text(
                            "The Company may use Personal Data for the following purposes:\n",
                            style:
                                kLoginTermsAndPrivacyStyle(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "",
                                  style: headingTwo(size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "- To provide and maintain our Service: including to monitor the usage of our Service.",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "",
                                  style: headingTwo(size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "- To manage Your Account: to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "",
                                  style: headingTwo(size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "- For the performance of a contract: the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "",
                                  style: headingTwo(size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "- To contact You: to contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application's push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "",
                                  style: headingTwo(size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "- To provide You: with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information.",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "",
                                  style: headingTwo(size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "- To manage Your requests: to attend and manage Your requests to Us.",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "",
                                  style: headingTwo(size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "- For business transfers: we may use Your information to evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred.",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  "",
                                  style: headingTwo(size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "- For other purposes: we may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience.\n\n",
                                  style: kLoginTermsAndPrivacyStyle(
                                      size, Colors.white),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Retention of Your Personal Data",
                            style: headingOne(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.\n",
                                style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                                // textAlign: TextAlign.center,
                              ),
                              Text(
                                "The Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.\n",
                                style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                                // textAlign: TextAlign.center,
                              ),
                            ],
                          ),

                          Text(
                            "Transfer of Your Personal Data",
                            style: headingOne(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your information, including Personal Data, is processed at the Company's operating offices and in any other places where the parties involved in the processing are located. It means that this information will not be transferred outside of company other than governmental jurisdiction where the data protection laws may differ than those from Your jurisdiction.\n",
                                style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                                // textAlign: TextAlign.center,
                              ),
                              Text(
                                "Your consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer.\n",
                                style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                                // textAlign: TextAlign.center,
                              ),
                              Text(
                                "The Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information.\n",
                                style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                              )
                            ],
                          ),

                          Text(
                            "Delete Your Personal Data",
                            style: headingOne(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "You have the right to delete or request that We assist in deleting the Personal Data that We have collected about You.\n",
                                style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                                // textAlign: TextAlign.center,
                              ),
                              Text(
                                "Our Service may give You the ability to delete certain information about You from within the Service.\n",
                                style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                                // textAlign: TextAlign.center,
                              ),
                              Text(
                                "You may update, amend, or delete Your information at any time by signing in to Your Account, if you have one, and visiting the account settings section that allows you to manage Your personal information. You may also contact Us to request access to, correct, or delete any personal information that You have provided to Us.\n",
                                style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                              ),
                              Text(
                                "Please note, however, that We may need to retain certain information when we have a legal obligation or lawful basis to do so.\n",
                                style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                              )
                            ],
                          ),


                          Text(
                            "Security of Your Personal Data",
                            style: headingOne(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.\n",
                                style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                                // textAlign: TextAlign.center,
                              ),
                            ],
                          ),


                          Text(
                            "Children's Privacy",
                            style: headingOne(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Our Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13. If You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us. If We become aware that We have collected Personal Data from anyone under the age of 13 without verification of parental consent, We take steps to remove that information from Our servers.\n",
                                style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                                // textAlign: TextAlign.center,
                              ),
                              Text(
                                "If We need to rely on consent as a legal basis for processing Your information and Your country requires consent from a parent, We may require Your parent's consent before We collect and use that information.\n",
                                style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                                // textAlign: TextAlign.center,
                              ),
                            ],
                          ),


                          Text(
                            "Links to Other Websites",
                            style: headingOne(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Our Service may contain links to other websites that are not operated by Us. If You click on a third party link, You will be directed to that third party's site. We strongly advise You to review the Privacy Policy of every site You visit.\n",
                                style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                                // textAlign: TextAlign.center,
                              ),
                              Text(
                                "We have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.\n",
                                style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                                // textAlign: TextAlign.center,
                              ),
                            ],
                          ),


                          Text(
                            "Changes to this Privacy Policy",
                            style: headingOne(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.\n",
                                style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                                // textAlign: TextAlign.center,
                              ),
                              Text(
                                "We will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the &quot;Last updated&quot; date at the top of this Privacy Policy.\n",
                                style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                                // textAlign: TextAlign.center,
                              ),
                              Text(
                                "You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.\n",
                                style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                                // textAlign: TextAlign.center,
                              ),
                            ],
                          ),

                          Text(
                            "Contact Us",
                            style: headingOne(size, Colors.white),
                            // textAlign: TextAlign.center,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "If you have any questions about this Privacy Policy, You can contact us:\n",
                                style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                                // textAlign: TextAlign.center,
                              ),
                              Text(
                                "By email: admin@gaingerms.com.\n",
                                style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                                // textAlign: TextAlign.center,
                              ),
                            ],
                          ),




                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
