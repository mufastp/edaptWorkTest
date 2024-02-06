import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/utils/extension/space_ext.dart';
import 'package:quiz_app/view/components/apptext.dart';
import 'package:quiz_app/view/screens/homepage/widget/homecard.dart';
import 'package:quiz_app/view/screens/quiz/quizpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          scale: 10,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.hBox,
              AppText(
                text: "Let's Play",
                color: ktextcolor,
                size: 25,
                weight: FontWeight.w600,
                letterspace: 0.5,
              ),
              AppText(
                text: "Be the First",
                color: ktextcolor.withOpacity(0.4),
                size: 16,
                weight: FontWeight.w400,
                letterspace: 0.5,
              ),
              30.hBox,
              HomeCard(
                ontap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => QuizScreen(
                          difficultyValues: "easy",
                        ),
                      ));
                },
                gradient: keasygrad,
                count: 1,
                title: 'Easy',
              ),
              HomeCard(
                ontap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => QuizScreen(
                          difficultyValues: "medium",
                        ),
                      ));
                },
                gradient: kmediumgrad,count: 2,
                title: 'Medium',
              ),
              HomeCard(
                ontap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => QuizScreen(
                          difficultyValues: "hard",
                        ),
                      ));
                },
                gradient: khard,count: 3,
                title: 'Hard',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
