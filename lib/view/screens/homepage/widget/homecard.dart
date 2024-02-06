// ignore_for_file: must_be_immutable

import 'package:quiz_app/utils/helper/helper_screensize.dart';
import 'package:quiz_app/view/components/apptext.dart';
import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class HomeCard extends StatelessWidget {
   HomeCard({super.key,required this.ontap,this.gradient,this.count,this.title});
  Function() ontap;
  Gradient? gradient;
  int? count;
  String? title;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
                onTap:ontap,
                child: Container(
                  width: ScreenUtil.screenWidth,
                  // height: 120,
                  decoration: BoxDecoration(
                    gradient:gradient?? LinearGradient(colors: [ Colors.teal,Colors.teal.shade200],begin: Alignment.topLeft,end: Alignment.bottomRight,),
                    borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(color: kblack.withOpacity(0.3),offset: Offset(5, 5),blurRadius: 10),
                    
                  ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start ,
                      children: [
                        AppText(text: title??'',color: kwhite,size: 22,weight: FontWeight.w600,letterspace: 0.5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 50,
                              child: ListView.builder(
                                itemCount:count?? 3,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                return  Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.star,size: 30,color: kwhite,),
                                );
                              },),
                            )
                           
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
    );
  }
}