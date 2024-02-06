import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/utils/helper/helper_screensize.dart';
import 'package:flutter/material.dart';

class PageEntryLoader extends StatelessWidget {
  const PageEntryLoader({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      color: kwhite,
      width: ScreenUtil.screenWidth,
      height: ScreenUtil.screenHeight,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}