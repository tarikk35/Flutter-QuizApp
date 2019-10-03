import 'package:quiz_app/models/ChoiceQuestion.dart';
import 'package:quiz_app/models/TFQuestion.dart';
import 'package:quiz_app/configs/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:quiz_app/request_handler.dart';

class QuestionService {
  static final QuestionService _questionService = QuestionService._internal();

  factory QuestionService() {
    return _questionService;
  }

  QuestionService._internal();

  Future fetchQuestions(String quizId) async {
    String uri = Constants.baseUrl + 'Quiz/$quizId';
    var response = await http.get(uri, headers: {'Token': Constants.userToken});
    RequestHandler.exceptionHandler(response);
    Map items = json.decode(response.body);
    print(items['tfQuestions'][0]);
    List questions = [...items['tfQuestions'], ...items['mcQuestions']];
    var _questionList = List.generate(questions.length, (index) {
      if (questions[index]['answer'] is bool) {
        return TFQuestion.fromJson(questions[index]);
      } else if (questions[index]['answer'] is int) {
        return ChoiceQuestion.fromJson(questions[index]);
      }
      return null;
    });
    return _questionList;
  }
}
