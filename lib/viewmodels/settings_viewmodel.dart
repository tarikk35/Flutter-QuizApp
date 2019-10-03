import 'package:mobx/mobx.dart';
import 'package:quiz_app/services/login_service.dart';
import 'package:quiz_app/services/profile_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_viewmodel.g.dart';

class SettingsModel = _LoginModel with _$SettingsModel;

abstract class _LoginModel with Store {
  ProfileService _profileService = ProfileService();

  LoginService _loginService = LoginService();

  @observable
  bool busy = false;

  @observable
  int selectedIcon = 0;

  @action
  Future changeAvatar(avatarId) async {
    busy = true;
    final response = await _profileService.setAvatar(avatarId);
    busy = false;
    return response;
  }

  @action
  Future setIconToPrefs(String iconid) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('iconid', iconid);
    selectedIcon = int.parse(iconid);
  }

  @action
  Future getIconFromPrefs() async {
    busy = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedIcon = int.parse(prefs?.getString('iconid') ?? '1');
    busy = false;
    return selectedIcon.toString();
  }

  @action
  Future logout() async {
    busy = true;
    bool result = false;
    try {
      String type = await _loginService.getLoginType();
      await _loginService.logout();
      if (type == 'Facebook') {
        await _loginService.fbLogin.logOut();
      } else if (type == 'Google') {
        await _loginService.googleSignIn.disconnect();
      }
      result = true;
    } catch (e) {
      result = false;
    }
    busy = false;
    return result;
  }
}
