import 'dart:async';
import 'package:quiz_app/utils/helper/helper_screensize.dart';
import 'package:quiz_app/view/screens/homepage/homepage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MyHomePage())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SizedBox(
        height: ScreenUtil.screenHeight,
        width: ScreenUtil.screenWidth,
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: 250,
          ),
        ),
      ),
    );
  }
}
