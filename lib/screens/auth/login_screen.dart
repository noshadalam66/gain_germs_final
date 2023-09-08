import 'dart:convert';
import '../../Theme/theme.dart';
import '../../Models/user_details.dart';
import '../../helper/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controllers/simple_ui_controller.dart';
import '../../constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


import '../../constants/app_constant.dart';
import '../../Models/commonmodel.dart';
import '../../routes/route_delegate.dart';
import '../../routes/route_handeler.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  bool apiCall = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // @override
  // initState() {
  //   super.initState();
  //   if(invitedby != ""){
  //     Navigator.pushNamed(context, MyRoutes.registerRoute);
  //     // nameController.clear();
  //     emailController.clear();
  //     passwordController.clear();
  //     _formKey.currentState?.reset();
  //     simpleUIController.isObscure.value = true;
  //   }
  // }

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  SimpleUIController simpleUIController = Get.put(SimpleUIController());

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
              if (constraints.maxWidth > 600) {
                return _buildLargeScreen(context, size, simpleUIController);
              } else {
                return _buildSmallScreen(context, size, simpleUIController);
              }
            },
          ),
        ),
      ),
    );
  }

  /// For large screens
  Widget _buildLargeScreen(
    BuildContext context,
    Size size,
    SimpleUIController simpleUIController,
  ) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: RotatedBox(
            quarterTurns: 3,
            child: Lottie.asset(
              'assets/coin.json',
              height: size.height * 0.3,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(width: size.width * 0.06),
        Expanded(
          flex: 5,
          child: _buildMainBody(
            context,
            size,
            simpleUIController,
          ),
        ),
      ],
    );
  }

  /// For Small screens
  Widget _buildSmallScreen(
    BuildContext context,
    Size size,
    SimpleUIController simpleUIController,
  ) {
    return Center(
      child: _buildMainBody(
        context,
        size,
        simpleUIController,
      ),
    );
  }

  /// Main Body
  Widget _buildMainBody(
    BuildContext context,
    Size size,
    SimpleUIController simpleUIController,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: size.width > 600
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          size.width > 600
              ? Container()
              : Lottie.asset(
                  'assets/wave.json',
                  height: size.height * 0.2,
                  width: size.width,
                  fit: BoxFit.fill,
                ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Login',
              style: kLoginTitleStyle(size, Colors.white),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Welcome Back',
              style: kLoginSubtitleStyle(size, Colors.white),
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  /// username or Gmail
                  TextFormField(
                    style: kTextFormFieldStyle(Colors.white),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.white),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    controller: emailController,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      } else if (!value.contains('@')) {
                        return 'please enter valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),

                  /// password
                  Obx(
                    () => TextFormField(
                      style: kTextFormFieldStyle(Colors.white),
                      controller: passwordController,
                      obscureText: simpleUIController.isObscure.value,
                      decoration: InputDecoration(
                        iconColor: Colors.white,
                        prefixIcon:
                            const Icon(Icons.lock_open, color: Colors.white),
                        suffixIcon: IconButton(
                          color: Colors.white,
                          icon: Icon(simpleUIController.isObscure.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            simpleUIController.isObscureActive();
                          },
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else if (value.length < 7) {
                          return 'at least enter 6 characters';
                        } else if (value.length > 30) {
                          return 'maximum character is 30';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),

                  Row(
                    children: [
                      // Checkbox(
                      //   value: showvalue,
                      //   onChanged: (value) {
                      //     setState(() {
                      //       showvalue = value ?? false;
                      //     });
                      //   },
                      // ),
                      Text(
                        "Check our ",
                        style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                        // textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: () {
                          AppRouterDelegate().setPathName(RouteData.term_and_condition.name);
                          // Navigator.pushNamed(
                          //     context, MyRoutes.termAndCondition);
                          // nameController.clear();
                          emailController.clear();
                          passwordController.clear();
                          _formKey.currentState?.reset();
                          simpleUIController.isObscure.value = true;
                        },
                        child: RichText(
                          text: TextSpan(
                            text: '',
                            style: kHaveAnAccountStyle(size, Colors.white),
                            children: [
                              TextSpan(
                                text: " Terms of Services ",
                                style: kLoginOrSignUpTextStyle(
                                  size,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        " and our ",
                        style: kLoginTermsAndPrivacyStyle(size, Colors.white),
                        // textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: () {
                          AppRouterDelegate().setPathName(RouteData.privacy_policy.name);
                          // Navigator.pushNamed(context, MyRoutes.privacyPolicy);
                          // nameController.clear();
                          emailController.clear();
                          passwordController.clear();
                          _formKey.currentState?.reset();
                          simpleUIController.isObscure.value = true;
                        },
                        child: RichText(
                          text: TextSpan(
                            text: '',
                            style: kHaveAnAccountStyle(size, Colors.white),
                            children: [
                              TextSpan(
                                text: " Privacy Policy",
                                style: kLoginOrSignUpTextStyle(
                                  size,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),

                  /// Login Button
                  loginButton(context),
                  SizedBox(
                    height: size.height * 0.03,
                  ),

                  /// Navigate To Login Screen
                  GestureDetector(
                    onTap: () {
                      AppRouterDelegate().setPathName(RouteData.register.name);
                      // Navigator.pushNamed(context, MyRoutes.registerRoute);
                      // nameController.clear();
                      emailController.clear();
                      passwordController.clear();
                      _formKey.currentState?.reset();
                      simpleUIController.isObscure.value = true;
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account?',
                        style: kHaveAnAccountStyle(size, Colors.white),
                        children: [
                          TextSpan(
                            text: " Sign up",
                            style: kLoginOrSignUpTextStyle(
                              size,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Login Button
  Widget loginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              GainGermsTheme().getTheme().buttonColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: () async {
          // Validate returns true if the form is valid, or false otherwise.
            if (_formKey.currentState!.validate()) {
              // showLoaderDialog(context);
              setState(() {
                apiCall = true;
              });
              loginUsers(
                  context, emailController.text, passwordController.text);
            }
        },
        child: const Text('Login'),
      ),
    );
  }

  loginUsers(BuildContext context, String email, String password) async {
    var uri = Uri.https('gaingerms.com', 'gainGermSit/login.php');
    // var <String: dynamic> headers: {
    //   "Access-Control-Allow-Origin": "*",
    // 'Content-Type': 'application/json',
    // 'Accept': '*/*'
    // };

    final response = await http.post(uri, body: <String, String>{
      'email': email,
      'password': password,
      'currentTime': DateTime.now().millisecondsSinceEpoch.toString(),
    });
    // var uri = Uri.https('gaingerms.com', 'gainGermSit/login.php');
    // final response = await http.post(
    //   Uri.parse('https://gaingerms.com/gainGermSit/login.php'),
    //   body: <String, String>{
    //     'email': email,
    //     'password': password,
    //     'currentTime': DateTime.now().millisecondsSinceEpoch.toString(),
    //   },
    // );
    UserResponse? customerDataObj;
    if (response.statusCode == 200) {
      Map<String, dynamic> userResponse = json.decode(response.body);
      print("jsonResponse ${userResponse}");

      // responseMessage
      if (userResponse["responseCode"].toString() == "1") {
        var customerData = userResponse; //['customerData'];
        customerDataObj = UserResponse.fromJson(customerData);
        print("customerDataObj ${customerDataObj}");
        addBoolToSF(isLoggedIn, true);

        String stringResponse = jsonEncode(customerDataObj);

        ///setting userResponse to SF as string
        setCDToSF(stringResponse);

        ///setting obj to global variable
        setUserDetail(customerDataObj);
        setState(() {
          apiCall = false;
        });
        AppRouterDelegate().setPathName(RouteData.home.name, loggedIn: true);
      } else {
        setState(() {
          apiCall = false;
        });
        // Navigator.pop(context);
        showAlertDialog(context, userResponse["responseMessage"].toString(),
            "Please check Email OR Password");
      }
      return customerDataObj;
    } else {
      setState(() {
        apiCall = false;
      });
      // Navigator.pop(context);
      showAlertDialog(context, "ERROR OCCURRED", "Unexpected error occurred!");
      // throw Exception('Unexpected error occurred!');
    }
  }
}
