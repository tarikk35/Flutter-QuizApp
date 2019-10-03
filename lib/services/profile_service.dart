import 'package:quiz_app/models/Result.dart';
import 'package:quiz_app/models/User.dart';
import 'package:quiz_app/configs/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:quiz_app/request_handler.dart';

class ProfileService {
  static final ProfileService _profileService = ProfileService._internal();

  factory ProfileService() {
    return _profileService;
  }

  ProfileService._internal();

  Future fetchCurrentUser() async {
    String uri = Constants.baseUrl + 'Me';
    var response = await http.get(uri, headers: {'Token': Constants.userToken});
    RequestHandler.exceptionHandler(response);
    var item = json.decode(response.body);
    return User.fromJson(item);
  }

  // Future fetchUser(String userId) async {
  //   String uri = Constants.baseUrl + 'User/$userId';
  //   var response = await http.get(uri,headers: {'Token':Constants.userToken});
  //   RequestHandler.exceptionHandler(response);
  //   var item = json.decode(response.body);
  //   return User.fromJson(item[0]);
  // }

  // Future fetchCategorySuccess() async {
  //   String uri = Constants.baseUrl + 'Me/success/categories';
  //   var response = await http.get(uri, headers: {'Token': Constants.userToken});
  //   RequestHandler.exceptionHandler(response);
  //   var item = json.decode(response.body);
  //   return CategorySuccess.fromJson(item);
  // }

  Future fetchQuizResults() async {
    // result gibi birşey
    String uri = Constants.baseUrl + 'Me/results';
    var response = await http.get(uri, headers: {'Token': Constants.userToken});
    RequestHandler.exceptionHandler(response);
    var item = json.decode(response.body);
    print(item);
    return List.generate(item.length, (index) {
      return Result.fromJson(item[index]);
    });
  }

  Future setAvatar(String avatarId) async {
    String uri = Constants.baseUrl + 'qweqwe?avatarId=$avatarId'; // TODO
    var response = await http.put(uri, headers: {'Token': Constants.userToken});
    RequestHandler.exceptionHandler(response);
    return true;
  }
}
