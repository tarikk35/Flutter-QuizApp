// import 'package:quiz_app/models/Quiz.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class EndQuizService {
  static final EndQuizService _endQuizService = EndQuizService._internal();

  factory EndQuizService() {
    return _endQuizService;
  }

  EndQuizService._internal();

  Future sendResults(List<int> answers,List<double> maxPoints)async{

  }
}
