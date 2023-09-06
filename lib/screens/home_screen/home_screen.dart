import '../../Theme/theme.dart';
import 'package:flutter/material.dart';
import '../../controllers/MyMenuController.dart';
import '../../screens/main/main_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SimpleUIController simpleUIController = Get.find<SimpleUIController>();
    return Scaffold(
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => MyMenuController(),
            ),
          ],
          child: MainScreen(),
        ));
  }
}
