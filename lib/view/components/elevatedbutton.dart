

import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/utils/helper/helper_screensize.dart';
import 'package:quiz_app/view/components/apptext.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  AppButton(
      {super.key,
      required this.onPressed,
      required this.data,
      this.bgcolor = Colors.black,
      this.btnstyle,this.height,
      this.width,
      this.forgcolor = Colors.white});
  Color? bgcolor;
  Color? forgcolor;
  String data;
  ButtonStyle? btnstyle; 
  double? height,width;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:height?? 50,
      width:width?? ScreenUtil.screenWidth,
      child: ElevatedButton(
          style:btnstyle?? ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(bgcolor),
            foregroundColor: MaterialStatePropertyAll(forgcolor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          onPressed:onPressed,
          child: AppText(text: data,color: kwhite,weight: FontWeight.w500,letterspace: 0.5,)),
    );
  }
}
