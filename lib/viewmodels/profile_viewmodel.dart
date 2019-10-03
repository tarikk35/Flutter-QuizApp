import 'package:mobx/mobx.dart';
import 'package:quiz_app/models/Result.dart';
import 'package:quiz_app/models/User.dart';
import 'package:quiz_app/services/profile_service.dart';

part 'profile_viewmodel.g.dart';

class ProfileModel = _ProfileModel with _$ProfileModel;

abstract class _ProfileModel with Store {
  @observable
  bool busy = false;

  @action
  void setBusy(bool state) {
    busy = state;
  }

  @observable
  User user;

  @observable
  int rank = 0;

  @observable
  List<Result> resultList;

  @observable
  bool hasError = false;

  String errorMessage;

  ProfileService _profileService = ProfileService();

  @action
  Future getUser() async {
    setBusy(true);
    hasError = false;
    try {
      user = await _profileService.fetchCurrentUser();
      resultList = await _profileService.fetchQuizResults();
    } catch (e) {
      hasError = true;
      errorMessage = e.toString().split(':')[0];
    }
    setBusy(false);
  }
}
