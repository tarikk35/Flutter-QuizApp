import 'package:quiz_app/models/Quiz.dart';
import 'package:quiz_app/models/Rank.dart';
import 'package:quiz_app/services/category_service.dart';

import 'package:mobx/mobx.dart';
import 'package:quiz_app/services/quiz_service.dart';

part 'category_viewmodel.g.dart';

class CategoryModel = _CategoryModel with _$CategoryModel;

abstract class _CategoryModel with Store {
  String _categoryId;
  @computed
  String get categoryId => _categoryId;

  List<Quiz> _quizzes = [];
  @computed
  List<Quiz> get quizzes => _quizzes;

  @observable
  Quiz selectedQuiz;

  @observable
  bool hasError = false;

  String errorMessage;

  @observable
  List<Rank> topThreeUserList = [];

  @observable
  int participants = 0;

  @observable
  double successRate = 0;

  @observable
  bool categoryBusy = false;

  @action
  void setCategoryBusy(bool state) {
    categoryBusy = state;
  }

  @observable
  bool quizBusy = false;

  @action
  void setQuizBusy(bool state) {
    quizBusy = state;
  }

  final categoryService = CategoryService();

  final quizService = QuizService();

  @action
  Future setQuiz(int index) async {
    setQuizBusy(true);
    hasError = false;
    if (_quizzes == null || _quizzes.isEmpty) return;
    selectedQuiz = quizzes[index];
    try {
      topThreeUserList =
          await quizService.fetchTopThree(selectedQuiz.quizId) ?? [];
      participants = selectedQuiz.participants;
      successRate =
          double.parse(selectedQuiz.successRate.toStringAsFixed(3)) * 100;
    } catch (e) {
      hasError = true;
      errorMessage = e.toString().split(':')[0];
    }
    setQuizBusy(false);
  }

  @action
  Future setCategory(String categoryid) async {
    setCategoryBusy(true);
    hasError = false;
    _categoryId = categoryid;
    try {
      _quizzes = await categoryService.fetchQuizzes(categoryId);
    } catch (e) {
      hasError = true;
      errorMessage = e.toString().split(':')[0];
    }
    setQuiz(0);
    setCategoryBusy(false);
  }
}
