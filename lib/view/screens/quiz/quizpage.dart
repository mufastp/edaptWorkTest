// ignore_for_file: must_be_immutable
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/utils/extension/space_ext.dart';
import 'package:quiz_app/utils/helper/helper_screensize.dart';
import 'package:quiz_app/view/components/apptext.dart';
import 'package:quiz_app/view/components/elevatedbutton.dart';
import 'package:quiz_app/view/components/pageentryloader.dart';
import 'package:quiz_app/view/screens/result/ResultPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/provideroperation.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({super.key, required this.difficultyValues});
  String difficultyValues;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  ProviderOperations poptn = ProviderOperations();
  int questionindex = 0;
  int? selectedOption;
  @override
  void initState() {
    Provider.of<ProviderOperations>(context, listen: false)
        .getQuestions(10, widget.difficultyValues);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final poptn = Provider.of<ProviderOperations>(context, listen: true);
    ScreenUtil.init(context);
    return Consumer<ProviderOperations>(builder: (context, value, child) {
      if (poptn.isLoding) {
        return PageEntryLoader();
      } else {
        return Scaffold(
          appBar: AppBar(),
          body: SizedBox(
            width: ScreenUtil.screenWidth,
            height: ScreenUtil.screenHeight,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: 'Question : ${questionindex + 1}',
                    color: ktextcolor,
                    size: 18,
                    weight: FontWeight.w600,
                    letterspace: 0.5,
                  ),
                  10.hBox,
                  //questions
                  AppText(
                    text: value.selectedquestion?.question ?? '',
                    color: ktextcolor,
                    size: 14,
                    weight: FontWeight.w500,
                    letterspace: 0.5,
                  ),
                  20.hBox,
                  AppText(
                    text: 'Choose an answer',
                    color: ktextcolor,
                    size: 16,
                    weight: FontWeight.w600,
                    letterspace: 0.5,
                  ),
                  20.hBox,
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: value.optionlist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                             onTap: () {
                          poptn.selectanswer(index);
                        },
                            child: Card(
                              color: value.optionlist[index].selected==true?Colors.teal.shade100:kwhite,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppText(
                                      text: value.optionlist[index].ans ?? '',
                                      color:value.optionlist[index].selected==true?kprimarycolor: ktextcolor,
                                      size: 16,
                                      weight: FontWeight.w500,
                                      letterspace: 0.5,
                                    ),
                                    Checkbox(
                                      value: value.optionlist[index].selected,
                                      shape: CircleBorder(),
                                      onChanged: ( newValue) {
                                      },
                                      activeColor: kprimarycolor),
                                  
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                  Spacer(),
                  poptn.isSelected
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppButton(
                              btnstyle: ButtonStyle(
                                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                  backgroundColor:
                                      MaterialStatePropertyAll(kprimarycolor)),
                              onPressed: () {
                                if (questionindex == 9) {
                                  Navigator.pushReplacement(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => ResultPage(),
                                      ));
                                } else {
                                  questionindex++;
                                  value.nextquestion(questionindex);
                                }
                              },
                              data: 'Next'),
                        )
                      : 0.hBox
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
