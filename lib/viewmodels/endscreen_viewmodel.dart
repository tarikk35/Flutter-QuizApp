import 'package:mobx/mobx.dart';
import 'package:quiz_app/models/User.dart';
import 'package:quiz_app/services/endquiz_service.dart';
// import 'package:quiz_app/services/endquiz_service.dart';

part 'endscreen_viewmodel.g.dart';

class EndscreenModel = _EndscreenModel with _$EndscreenModel;

abstract class _EndscreenModel with Store {
  @observable
  bool busy = false;

  @action
  void setBusy(bool state) {
    busy = state;
  }

  @observable
  int rank = 0;

  @observable
  bool hasError = false;

  String errorMessage;

  @observable
  User user;

  @observable
  List<int> answers = [];

  @action
  void setAnswers(List<int> answers) {
    this.answers = answers;
  }

  @observable
  int score = 0;

  EndQuizService _endQuizService = EndQuizService();

  @action
  Future getRank() async {} // yapılacak

  @action
  void calculateScore(List<int> scoreList, List<double> timePercentages,
      List<double> maxPoints) {
    setBusy(true);
    answers = scoreList;
    List.generate(scoreList.length, (index) {
      switch (scoreList[index]) {
        case 1:
          score = score + (maxPoints[index] * timePercentages[index]).ceil();
          break;
        case 2:
          break;
        case 3:
          score = score + ((maxPoints[index] * 0.12).round());
          break;
        default:
          break;
      }
    });
    setBusy(false);
  }

  @action
  void setUser(String userId) {}
}
