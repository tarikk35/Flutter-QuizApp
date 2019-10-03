import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:quiz_app/services/login_service.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

part 'login_viewmodel.g.dart';

class LoginViewModel = _LoginViewModel with _$LoginViewModel;

abstract class _LoginViewModel with Store {
  @observable
  bool busy = false;

  @action
  void setBusy(bool state) {
    busy = state;
  }

  @observable
  bool isLoggedIn = false;

  @observable
  bool hasError = false;

  String errorMessage;

  final LoginService _loginService = LoginService();

  @action
  Future autoLogin() async {
    setBusy(true);
    // await googleSignIn.signInSilently();
    if (await _loginService.autoLogin()) {
      isLoggedIn = true;
    } else {
      isLoggedIn = false;
    }
    setBusy(false);
    return isLoggedIn;
  }

  //  TODO : Post {
  // "id": "string",
  // "token": "string",
  // "email": "string",
  // "fullName": "string",
  // "imageUrl": "string",
  // "totalScore": 0}

  @action
  Future loginWithFacebook() async {
    setBusy(true);
    Map userProfile;
    final result =
        await _loginService.fbLogin.logInWithReadPermissions(['email']);
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=$token');
        final profile = JSON.jsonDecode(graphResponse.body);
        userProfile = profile;
        print(token);
        await _loginService.facebookLogin(userProfile['id']);
        isLoggedIn = true;
        break;

      case FacebookLoginStatus.cancelledByUser:
        isLoggedIn = false;
        break;
      case FacebookLoginStatus.error:
        isLoggedIn = false;
        break;
    }
    // kullanıcıyı sharedprefs içine kaydet ve token almak için servisin loginine yönlendir.
    // kullanıcı yeni üyeyse avatar seçme hakkı alabilme fonksiyonu eklenebilir.
    // return isLoggedIn;
    setBusy(false);
    return isLoggedIn;
  }

  @action
  Future loginWithGoogle() async {
    setBusy(true);
    try {
      final user = await _loginService.googleSignIn.signIn();
      print(await _loginService.googleSignIn.currentUser.authHeaders);
      if (user != null) {
        await _loginService.googleLogin(
          _loginService.googleSignIn.currentUser.id,
        );
        isLoggedIn = true;
      } else {
        // user cancelled login process
        isLoggedIn = false;
      }
    } on PlatformException catch (_) {
      isLoggedIn = false;
    }
    // kullanıcıyı sharedprefs içine kaydet ve token almak için servisin loginine yönlendir.
    // return isLoggedIn;
    setBusy(false);
    return isLoggedIn;
  }
}
