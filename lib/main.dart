
import 'package:quiz_app/controller/provideroperation.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/view/screens/splash/splashpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderOperations(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quiz',
        home:  SplashScreen(),
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            shape: Border(bottom: BorderSide(color: kblack.withOpacity(0.1))),
            backgroundColor: kwhite,
            iconTheme: IconThemeData(
              color: kblack
            ),
            titleTextStyle: TextStyle(
              color: ktextcolor,
              fontSize: 16,
              fontWeight: FontWeight.w500
            )
          )
        ),
      ),
    );
  }
}


