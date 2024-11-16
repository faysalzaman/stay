

import 'package:flutter/material.dart';
import 'package:stay/screens/localization_screen/select_language_screen.dart';
import 'package:stay/utils/app_navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      AppNavigator.push(context,  SelectLanguageScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0.5,
      ),
      body: Center(
        child: Image.asset("assets/splash.jpg"),
      ),
    );
  }
}
