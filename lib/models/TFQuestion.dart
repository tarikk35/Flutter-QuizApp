import 'package:quiz_app/models/Question.dart';

class TFQuestion extends Question {
  bool answer;
  TFQuestion.fromJson(Map<String, dynamic> json)
      : this.answer = json['answer'],
        super(
            quizId: json['qid'],
            question: json['title'] ?? '',
            duration: double.parse((json['duration'] ?? 10.0).toString()),
            maxPoint: double.parse((json['point'] ?? 0.0).toString()),
            questionIndex: int.parse((json['qnumber'] ?? 0).toString()));
}
