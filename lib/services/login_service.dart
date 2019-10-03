// import 'package:quiz_app/configs/constants.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  static final LoginService _loginService = LoginService._internal();

  factory LoginService() {
    return _loginService;
  }

  LoginService._internal();

  final FacebookLogin fbLogin = FacebookLogin();
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
    ],
  );

  Future facebookLogin(String token) async {
    //TODO: get token and save to prefs and constants
    await savePrefs(token, 'Facebook');
    return true;
  }

  Future googleLogin(String token) async {
    // TODO: get token and save to prefs and constants
    await savePrefs(token, 'Google');
    return true;
  }

  Future autoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token');
    final String logintype = prefs.getString('logintype');
    if (token == null || logintype == null) return false;
    // login to server using infos or token ...
    // userId'yi shared prefs içine yazabilir
    if (token.isNotEmpty && logintype.isNotEmpty) {
      return true;
    } // login with token and take user data

    return false;
  }

  Future getLoginType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String logintype = prefs.getString('logintype');
    return logintype;
  }

  Future savePrefs(String token, String logintype) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('logintype', logintype);
    return true;
  }

  Future logout() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('logintype');
      await prefs.remove('token');
      return true;
    } catch (e) {
      return false;
    }
  }
}
