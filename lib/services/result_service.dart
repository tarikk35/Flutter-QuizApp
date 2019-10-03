import 'package:quiz_app/configs/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:quiz_app/models/Result.dart';
import 'package:quiz_app/request_handler.dart';

class ResultService {
  static final ResultService _resultService = ResultService._internal();

  factory ResultService() {
    return _resultService;
  }

  ResultService._internal();

  Result _result;

  Result get result => _result;

  Future fetchResult(String userid, String quizid) async {
    String uri = Constants.baseUrl + 'results?userid=$userid&quizid=$quizid';
    var response = await http.get(uri,headers: {'Token':Constants.userToken});
    RequestHandler.exceptionHandler(response);
    List items = json.decode(response.body);
    _result = Result.fromJson(items[0]);
    return;
  }
}
