import 'package:quiz_app/models/Rank.dart';
import 'package:quiz_app/configs/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:quiz_app/request_handler.dart';

class LeaderboardService {
  static final LeaderboardService _leaderboardService =
      LeaderboardService._internal();

  factory LeaderboardService() {
    return _leaderboardService;
  }

  LeaderboardService._internal();

  Future fetchDailyLeaderboard() async {
    String uri = Constants.baseUrl + 'Result/top100/daily';
    var response = await http.get(uri,headers: {'Token':Constants.userToken});
    RequestHandler.exceptionHandler(response);
    List items = json.decode(response.body);
    var _list = List.generate(items.length, (index) {
      return Rank.fromJson(items[index]);
    });
    return _list;
  }

  Future fetchTotalLeaderboard() async {
    String uri = Constants.baseUrl + 'Result/top100/all';
    var response = await http.get(uri,headers: {'Token':Constants.userToken});
    RequestHandler.exceptionHandler(response);
    List items = json.decode(response.body);
    var _items = List.generate(items.length, (index) {
      return Rank.fromJson(items[index]);
    });
    return _items;
  }

  Future
      fetchCurrentUserDaily() async {} // << Alp'e sor ve rank modeli oluşturulabilir.
  Future fetchCurrentUserTotal() async {}
}