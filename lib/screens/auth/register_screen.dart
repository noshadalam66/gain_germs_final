import 'dart:convert';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import '../../Theme/theme.dart';
import '../../util/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../constants/constants.dart';
import '../../controllers/simple_ui_controller.dart';
import 'package:http/http.dart' as http;

import 'package:phone_number/phone_number.dart';
import '../../constants/app_constant.dart';
import '../../Models/commonmodel.dart';
import '../../Models/user_details.dart';
import '../../helper/shared_preferences.dart';
import '../../routes/route_delegate.dart';
import '../../routes/route_handeler.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  bool apiCall = false;
  bool showvalue = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  SimpleUIController simpleUIController = Get.put(SimpleUIController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

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
                  return _buildLargeScreen(size, simpleUIController, theme);
                } else {
                  return _buildSmallScreen(size, simpleUIController, theme);
                }
              },
            ),
          )),
    );
  }

  /// For large screens
  Widget _buildLargeScreen(
      Size size, SimpleUIController simpleUIController, ThemeData theme) {
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
          child: _buildMainBody(size, simpleUIController, theme),
        ),
      ],
    );
  }

  /// For Small screens
  Widget _buildSmallScreen(
      Size size, SimpleUIController simpleUIController, ThemeData theme) {
    return Center(
      child: _buildMainBody(size, simpleUIController, theme),
    );
  }

  /// Main Body
  Widget _buildMainBody(
      Size size, SimpleUIController simpleUIController, ThemeData theme) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
        size.width > 600 ? MainAxisAlignment.center : MainAxisAlignment.start,
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
              'Sign Up',
              style: kLoginTitleStyle(size, GainGermsTheme().getTheme().white),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Create Account',
              style: kLoginSubtitleStyle(size, GainGermsTheme().getTheme().white),
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
                  /// username
                  TextFormField(
                    style: kTextFormFieldStyle(GainGermsTheme().getTheme().white),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.white),
                      hintText: 'Full Name (John Smith)',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),

                    ),

                    controller: nameController,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter full name';
                      } else if (value.length < 4) {
                        return 'at least enter 4 characters';
                      } else if (value.length > 100) {
                        return 'maximum character is 100';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),

                  /// Gmail
                  TextFormField(
                    style: kTextFormFieldStyle(GainGermsTheme().getTheme().white),
                    controller: emailController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_rounded, color: Colors.grey),
                      hintText: 'Email (john_smith@gmail.com)',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
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


                  /// PHone Number
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    style: kTextFormFieldStyle(GainGermsTheme().getTheme().white),
                    controller: phoneNumberController,
                    onChanged: (String value) async{
                      PhoneNumber phoneNumber = await PhoneNumberUtil().parse(value);
                      print("phoneNumber ${phoneNumber}");

                      // PhoneNumberFormat phoneNumber = await PhoneNumberFormat.international
                      // PhoneNumber phoneNumber = await PhoneNumberUtil().parse(springFieldUSA);
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone_android, color: Colors.white),
                      hintText: 'Contact Number (+1 000 000 0000)',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter contact number';
                      } else if (!value.contains('+')) {
                        return 'please enter contact number with +';
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
                      style: kTextFormFieldStyle(GainGermsTheme().getTheme().white),
                      controller: passwordController,
                      obscureText: simpleUIController.isObscure.value,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_open, color: Colors.white),
                        suffixIcon: IconButton(
                          color: GainGermsTheme().getTheme().white,
                          icon: Icon(
                            simpleUIController.isObscure.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            simpleUIController.isObscureActive();
                          },
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
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
                    height: size.height * 0.02,
                  ),
                  /// confirm password
                  Obx(
                        () => TextFormField(
                      style: kTextFormFieldStyle(GainGermsTheme().getTheme().white),
                      controller: confirmPasswordController,
                      obscureText: simpleUIController.isObscure.value,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_open, color: Colors.white),
                        suffixIcon: IconButton(
                          color: GainGermsTheme().getTheme().white,
                          icon: Icon(
                            simpleUIController.isObscure.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            simpleUIController.isObscureActive();
                          },
                        ),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(color: Colors.grey),
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
                      Checkbox(
                        value: showvalue,
                        onChanged: (value) {
                          setState(() {
                            showvalue = value ?? false;
                          });
                        },
                      ),
                      Text(
                        "Confirm our ",
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

                  /// SignUp Button
                  signUpButton(theme),
                  SizedBox(
                    height: size.height * 0.03,
                  ),

                  /// Navigate To Login Screen
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      nameController.clear();
                      emailController.clear();
                      passwordController.clear();
                      confirmPasswordController.clear();
                      _formKey.currentState?.reset();

                      simpleUIController.isObscure.value = true;
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account?',
                        style: kHaveAnAccountStyle(size, GainGermsTheme().getTheme().white),
                        children: [
                          TextSpan(
                              text: " Login",
                              style: kLoginOrSignUpTextStyle(size)),
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

  // SignUp Button
  Widget signUpButton(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(GainGermsTheme().getTheme().buttonColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: () {
          // Validate returns true if the form is valid, or false otherwise.
          if (showvalue == true) {
            if (_formKey.currentState!.validate()) {
              // ... Navigate To your Home Page
              if (confirmPasswordController.text != passwordController.text) {
                showAlertDialog(context, "Password Alert",
                    "Your Password does not match!\nPlease enter confirm your password");
              } else {
                var uuid = Uuid();
                String uuidString = uuid.v4().substring(0, 13);
                setState(() {
                  apiCall = true;
                });
                registerUser(context, nameController.text, emailController.text,
                    passwordController.text, phoneNumberController.text, invitedby, uuidString);
              }
            }
          }else{
            showAlertDialog(context, "Terms Condition & Privacy Policy",
                "Please Accept Privacy Policy & Terms Condition to continue");
          }
        },
        child: const Text('Sign up'),
      ),
    );
  }


  registerUser(BuildContext context, String fullName, String email, String password, String phoneNumberString, String refBy, String refCode) async {

    final response = await http.post(
      Uri.parse('https://gaingerms.com/gainGermSit/register.php'),
      body: <String, String>{
        'fullName': fullName,
        'email': email,
        'contactNo': phoneNumberString,
        'countryCode': "0",
        'password': password,
        'refBy': refBy,
        'refCode' :refCode,
        'currentTime': DateTime.now().millisecondsSinceEpoch.toString(),
      },
    );
    UserResponse? customerDataObj;
    if (response.statusCode == 200) {
      Map<String, dynamic> userResponse = json.decode(response.body);
      print("jsonResponse ${userResponse}");

      // responseMessage
      if (userResponse["responseCode"].toString() == "1") {
        var customerData = userResponse;//['customerData'];
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

      }else{
        // Navigator.pop(context);
        setState(() {
          apiCall = false;
        });
        showAlertDialog(context, "Email Exist!", userResponse["responseMessage"].toString());
      }

      return customerDataObj;
    } else {
      // Navigator.pop(context);
      setState(() {
        apiCall = false;
      });
      showAlertDialog(context, "ERROR OCCURRED", "Unexpected error occurred!");
      // throw Exception('Unexpected error occurred!');
    }
  }

}
