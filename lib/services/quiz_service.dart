import 'package:quiz_app/models/Rank.dart';
import 'package:quiz_app/configs/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:quiz_app/request_handler.dart';

class QuizService {
  static final QuizService _quizService = QuizService._internal();

  factory QuizService() {
    return _quizService;
  }

  QuizService._internal();

  Future fetchTopThree(String quizId) async {
    String uri = Constants.baseUrl + 'Result/quiz?id=$quizId';
    var response = await http.get(uri, headers: {'Token': Constants.userToken});
    RequestHandler.exceptionHandler(response);
    List items = json.decode(response.body);
    if (items.length == 0) {
      return null;
    }
    final _topThreeUserList = List.generate(items.length, (index) {
      return Rank.fromJson(items[index]);
    });
    return _topThreeUserList;
  }
}
