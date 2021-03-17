import 'package:firebase_core/firebase_core.dart';

import './src/ui/homePage.dart';
import './src/splash/splash_screens.dart';
import './src/Constant/Constant.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flipkart',
      theme: ThemeData(
        primaryColor: Color(0xff2874F0),
      ),
      routes: <String, WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) => AnimatedSplashScreen(),
        HOME_SCREEN: (BuildContext context) => HomePage(),
      },
      home: AnimatedSplashScreen(),
    );
  }
}
