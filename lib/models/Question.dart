import 'package:flutter/cupertino.dart';

abstract class Question {
  final String quizId;
  String question;
  double duration;
  double maxPoint;
  int questionIndex;
  Question(
      {@required this.quizId,
      this.question,
      this.duration,
      this.maxPoint,
      this.questionIndex});
}
