import 'package:quiz_app/models/Quiz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:quiz_app/configs/constants.dart';
import 'package:quiz_app/request_handler.dart';

class CategoryService {
  static final CategoryService _categoryService = CategoryService._internal();

  factory CategoryService() {
    return _categoryService;
  }

  CategoryService._internal();

  Future fetchQuizzes(String categoryId) async {
    String uri =
        Constants.baseUrl + 'Quiz/Category?name=Cat3'; // TODO < Dynamic
    var response = await http.get(uri, headers: {'Token': 'Token8'});
    RequestHandler.exceptionHandler(response);
    List items = json.decode(response.body);
    var _quizzes = List.generate(items.length, (index) {
      return Quiz.fromJson(items[index]);
    });
    return _quizzes;
  }
}
