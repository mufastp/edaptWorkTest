import 'dart:developer';

import 'package:quiz_app/controller/service.dart';
import 'package:quiz_app/models/ansselect.dart';
import 'package:flutter/cupertino.dart';
import '../models/quizdatamodel.dart';

class ProviderOperations with ChangeNotifier {
  final service = ProviderService();
  bool isLoding = false;
  bool isSelected = false;
  QuestionList questionlist = QuestionList();
  getQuestions(int? index, String type) async {
    isLoding = true;
    questionlist = await service.getquestion(index, type);
    selectedquestion = questionlist.results![0];
    optionlist = selectedquestion!.incorrectAnswers!
        .map((e) => AnsSelect(ans: e))
        .toList();
    optionlist.add(AnsSelect(ans: selectedquestion?.correctAnswer ?? ''));
    optionlist.shuffle();
    isLoding = false;
    notifyListeners();
  }

  Result? selectedquestion;
  List<AnsSelect> optionlist = [];
  // method for click next question

  nextquestion(int index) {
    optionlist.clear();
    selectedquestion = questionlist.results![index];
    optionlist = selectedquestion!.incorrectAnswers!
        .map((e) => AnsSelect(ans: e))
        .toList();
    optionlist.add(AnsSelect(ans: selectedquestion?.correctAnswer ?? ''));
    optionlist.shuffle();
    isSelected = false;
    notifyListeners();
  }
// method for select answer onclick function
  selectanswer(index) {
    selectedquestion?.selctedAnswer = optionlist[index].ans;
    for (var i = 0; i < optionlist.length; i++) {
      if (i!=index) {
        optionlist[i].selected = false;
      }else{
        optionlist[index].selected = true;
      }
    }
    isSelected = true;
    notifyListeners();
  }
  int correctAns = 0;
  int incorrectAns = 0;
  getresult(){
    correctAns =0;
    incorrectAns =0;
    log(questionlist.toJson().toString());
    for (var i = 0; i < questionlist.results!.length; i++) {
      if (questionlist.results![i].correctAnswer?.trim() == questionlist.results![i].selctedAnswer?.trim()) {
        correctAns++;
      }else{
        incorrectAns++;
      }
    }
    notifyListeners();
  }
}
