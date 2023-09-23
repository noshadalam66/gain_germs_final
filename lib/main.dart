import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gain_germs_final/routes/app.dart';
import 'package:gain_germs_final/screens/homepage/home_page_page.dart';
import 'package:gain_germs_final/screens/homepage/home_page_screen.dart';
import 'package:http/http.dart' as http;
import 'package:url_strategy/url_strategy.dart';
import 'dart:convert';
import 'Models/commonmodel.dart';
import 'Models/user_details.dart';
import 'constants/constants.dart';
import 'firebase_options.dart';
import 'helper/shared_preferences.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'dart:math';
// import 'package:admanager_web/admanager_web.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyAED0AxDxgrCQGu0FnsvUKuQl-Szjuoa9U", appId: "1:442911630671:web:537f250d387e9c77ced13a", messagingSenderId: "442911630671", projectId: "gaingerms"));
  // await EasyLocalization.ensureInitialized();

  // Initialize the AdManager package
  // AdManagerWeb.init();

  String url = window.location.href;
  print('The URL is: $url');
  url = url.split('#/').join();

  Uri uri = Uri.parse(url);

  invitedby = uri.queryParameters['invitedby'] ?? ""; // id = "123"
  // String? name = uri.queryParameters['name']; // name = "john"
  path = uri.path; // path = "/page"
  // String? scheme = uri.scheme; // scheme = "https"
  // String? host = uri.host; // host = "example.com"
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setPathUrlStrategy();

  var userLanguage = "en_US"; //await getStringValuesSF("AppLanguage");
  if (userLanguage == '') {
    final String defaultLocale = "en_US";//Platform.localeName;
    if (defaultLocale == 'en_US') {
      userLanguage = "en";
      // await addStringToSF("AppLanguage", "en");
    } else if (defaultLocale == 'ar_DZ') {
      userLanguage = "ar";
      // await addStringToSF("AppLanguage", "ar");
    }
  }

  bool isUserLoggedIn = await getBoolValuesSF(isLoggedIn);


  runApp(App(
    isLoggedIn: isUserLoggedIn,
  ));

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GainGerms',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePagePage()//MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widgets is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widgets) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String name = "name";
  bool apiCall = false;
  loginUsers(BuildContext context, String email, String password) async {
    var uri = Uri.https('gaingerms.com', 'gainGermSit/login.php');
    // var <String: dynamic> headers = {
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
        name = customerDataObj.customerData?.fullName ?? "";
        addBoolToSF(isLoggedIn, true);

        String stringResponse = jsonEncode(customerDataObj);

        ///setting userResponse to SF as string
        setCDToSF(stringResponse);

        ///setting obj to global variable
        setUserDetail(customerDataObj);
        setState(() {
          apiCall = false;
        });
        // AppRouterDelegate().setPathName(RouteData.home.name, loggedIn: true);
      } else {
        setState(() {
          apiCall = false;
        });
        // // Navigator.pop(context);
        // showAlertDialog(context, userResponse["responseMessage"].toString(),
        //     "Please check Email OR Password");
      }
      return customerDataObj;
    } else {
      setState(() {
        apiCall = false;
      });
      // // Navigator.pop(context);
      // showAlertDialog(context, "ERROR OCCURRED", "Unexpected error occurred!");
      // throw Exception('Unexpected error occurred!');
    }
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      // _counter++;
      apiCall = true;
    });
    loginUsers(context, "alam.noshad70@gmail.com", "123456789");
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ModalProgressHUD(
        inAsyncCall: apiCall,
        child: Center(
          // Center is a layout widgets. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widgets. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            //
            // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            // action in the IDE, or press "p" in the console), to see the
            // wireframe for each widgets.
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have no widgets: --disable-extensions, disable-web-security active',
              ),
              Text(
                '$name',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'AdManager Web Flutter',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'AdManager Web Flutter'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   List<Widget>? contentssss;
//   @override
//   void initState() {
//     super.initState();
//
//     contentssss = [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: const [
//           Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text("Click + button to add content and AD example"),
//           ),
//         ],
//       )
//     ];
//     _addMoreContent();
//   }
//
//
//
//   void _addMoreContent() {
//     List<Widget> newContent = [];
//
//
//     // Add Ad from AdManager using the AdManager package
//     newContent.add(const Padding(
//       padding: EdgeInsets.all(8.0),
//       child: AdBlock(
//         size: [AdBlockSize.leaderboard],
//         adUnitId: "/6355419/Travel/Europe",
//       ),
//     ));
//
//     // Add Ad from AdManager using the AdManager package
//     newContent.add(const Padding(
//       padding: EdgeInsets.all(8.0),
//       child: AdBlock(
//         size: [AdBlockSize.largeRectangle],
//         adUnitId: "/6355419/Travel/Europe",
//       ),
//     ));
//
//     // Add Ad from AdManager using the AdManager package
//     newContent.add(const Padding(
//       padding: EdgeInsets.all(8.0),
//       child: AdBlock(
//         size: [AdBlockSize.mediumRectangle],
//         adUnitId: "/6355419/Travel/Europe",
//       ),
//     ));
//
//     // Add Ad from AdManager using the AdManager package
//     newContent.add(const Padding(
//       padding: EdgeInsets.all(8.0),
//       child: AdBlock(
//         size: [AdBlockSize.banner],
//         adUnitId: "/6355419/Travel/Europe",
//       ),
//     ));
//
//     // Add Ad from AdManager using the AdManager package
//     newContent.add(const Padding(
//       padding: EdgeInsets.all(8.0),
//       child: AdBlock(
//         size: [AdBlockSize.mobileBanner],
//         adUnitId: "/6355419/Travel/Europe",
//       ),
//     ));
//
//     // Add Ad from AdManager using the AdManager package
//     newContent.add(const Padding(
//       padding: EdgeInsets.all(8.0),
//       child: AdBlock(
//         size: [AdBlockSize.mobileLeaderboard],
//         adUnitId: "/6355419/Travel/Europe",
//       ),
//     ));
//
//     // Add Ad from AdManager using the AdManager package
//     newContent.add(const Padding(
//       padding: EdgeInsets.all(8.0),
//       child: AdBlock(
//         size: [AdBlockSize.mobileBannerLarger],
//         adUnitId: "/6355419/Travel/Europe",
//       ),
//     ));
//
//     // Add Ad from AdManager using the AdManager package
//     newContent.add(const Padding(
//       padding: EdgeInsets.all(8.0),
//       child: AdBlock(
//         size: [AdBlockSize.skyscraper],
//         adUnitId: "/6355419/Travel/Europe",
//       ),
//     ));
//
//     // Add Ad from AdManager using the AdManager package
//     newContent.add(const Padding(
//       padding: EdgeInsets.all(8.0),
//       child: AdBlock(
//         size: [AdBlockSize.wideSkyscraper],
//         adUnitId: "/6355419/Travel/Europe",
//       ),
//     ));
//
//     // Add Ad from AdManager using the AdManager package
//     newContent.add(const Padding(
//       padding: EdgeInsets.all(8.0),
//       child: AdBlock(
//         size: [AdBlockSize.helfPage],
//         adUnitId: "/6355419/Travel/Europe",
//       ),
//     ));
//
//
//
//     // setState(() {
//       contentssss!.addAll(newContent);
//     // });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _addMoreContent();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widgets.title),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: contentssss!,
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: _addMoreContent,
//       //   tooltip: 'Add Content',
//       //   child: const Icon(Icons.add),
//       // ),
//     );
//   }
// }