import 'package:flutter/cupertino.dart';
import 'package:quiz_app/models/Question.dart';

class ChoiceQuestion extends Question {
  String firstChoice;
  String secondChoice;
  String thirdChoice;
  String fourthChoice;
  int answer;
  ChoiceQuestion(
      {this.firstChoice,
      this.answer,
      this.fourthChoice,
      this.secondChoice,
      this.thirdChoice,
      @required String quizId,
      String question,
      double duration,
      double maxPoint,
      int index})
      : super(
            quizId: quizId,
            duration: duration,
            maxPoint: maxPoint,
            question: question,
            questionIndex:index);

  ChoiceQuestion.fromJson(Map<String, dynamic> json)
      : this.firstChoice = json['choice1'],
        this.secondChoice = json['choice2'],
        this.thirdChoice = json['choice3'],
        this.fourthChoice = json['choice4'],
        this.answer = json['answer'],
        super(
          quizId: json['qid'],
          question: json['title'],
          duration: double.parse((json['duration']??10.0).toString()),
          maxPoint: double.parse((json['point']??10).toString()),
          questionIndex:json['qnumber'],
        );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'quizid': this.quizId,
      'duration': this.duration,
      'maxpoint': this.maxPoint,
      'question': this.question,
      'firstchoice': this.firstChoice,
      'secondchoice': this.secondChoice,
      'thirdchoice': this.thirdChoice,
      'fourthchoice': this.fourthChoice,
      'answer': this.answer,
      'index':this.questionIndex
    };
    return data;
  }
}
