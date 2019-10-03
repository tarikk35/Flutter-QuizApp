import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:quiz_app/configs/constants.dart';
import 'package:quiz_app/models/ChoiceQuestion.dart';
import 'package:quiz_app/models/Question.dart';
import 'package:quiz_app/models/TFQuestion.dart';
import 'package:quiz_app/services/question_service.dart';

part 'question_viewmodel.g.dart';

class QuestionModel = _QuestionModel with _$QuestionModel;

abstract class _QuestionModel with Store {
  @observable
  bool busy = false;

  bool _quizFinished = false;

  bool get quizFinished => _quizFinished;

  @observable
  bool isAnswered = false;

  @observable
  bool hasError = false;

  String errorMessage;

  @action
  void setBusy(bool state) {
    busy = state;
  }

  List<int> _score = [];

  List<int> _answerSeconds = [];

  @observable
  List scores = [];

  @observable
  List<Question> questionList = [];

  bool _isTrue = false;

  @observable
  Question currentQuestion;

  final _questionService = QuestionService();

  @observable
  double countdown = 0;

  AnimationController _controller;

  AnimationController setController(controller) {
    _controller = controller;
    _controller.duration = Duration(seconds: currentQuestion.duration.toInt());
    _controller.forward();
    return _controller;
  }

  @action
  Future markQuestion({answer}) async {
    //0=not solved, 1=true, 2=false, 3=skip
    if (answer == null) {
      _isTrue = false;
      _score[currentQuestion.questionIndex] = 3;
      await Future.delayed(Duration(seconds: 2));
    } else if (currentQuestion is TFQuestion) {
      _isTrue = (currentQuestion as TFQuestion).answer == answer;
      _score[currentQuestion.questionIndex] = _isTrue ? 1 : 2;
    } else if (currentQuestion is ChoiceQuestion) {
      _isTrue = (currentQuestion as ChoiceQuestion).answer == answer;
      _score[currentQuestion.questionIndex] = _isTrue ? 1 : 2;
    }
    scores[currentQuestion.questionIndex] =
        Constants.scoreColors[_score[currentQuestion.questionIndex]];
    nextQuestion();
    setAnswered(false);
  }

  @action
  void setAnswered(state) {
    if (state) {
      _answerSeconds.add((_controller.lastElapsedDuration??Duration(seconds: currentQuestion.duration.toInt())).inSeconds ??
          currentQuestion.duration.toInt());
      _controller.stop();
    } else {
      _controller.reset();
      _controller.forward();
    }
    isAnswered = state;
  }

  @action
  void resetTotalScore() {
    _score = List<int>.generate(questionList.length, (_) {
      // dynamic
      return 0;
    });
    scores = List<Color>.generate(questionList.length, (_) {
      return Constants.scoreColors[0];
    });
  }

  @action
  Future getQuestions(String quizId) async {
    setBusy(true);
    hasError = false;
    try {
      questionList = await _questionService.fetchQuestions(quizId) ?? [];
      questionList.sort((a, b) => a.questionIndex.compareTo(b.questionIndex));
      currentQuestion = questionList[0] ?? null;
      resetTotalScore();
    } catch (e) {
      hasError = true;
      errorMessage = e.toString().split(':')[0];
    }
    setBusy(false);
    return;
  }

  @action
  void nextQuestion() {
    _isTrue = false;
    if (currentQuestion.questionIndex + 1 == questionList.length) {
      _quizFinished = true;
      return;
    }
    currentQuestion = questionList[currentQuestion.questionIndex + 1] ?? null;
    _handleAnimation();
  }

  void _handleAnimation() {
    _controller.duration = Duration(seconds: currentQuestion.duration.toInt());
    if (_controller.isDismissed)
      _controller.forward();
    else if (_controller.isCompleted) {
      _controller.reset();
      _controller.forward();
    } else if (_controller.isAnimating) {
      _controller.reset();
      _controller.forward();
    }
  }

  // Streak değişkeni tut. eğer %20 sürede cevaplandıysa streak'i arttır.
  // TODO : Streak'i kullanıcının bilmesi için bir gösterge ekle.
  List getResults() {
    final timePercentages = List.generate(questionList.length, (index) {
      return (questionList[index].duration - _answerSeconds[index]) /
          questionList[index].duration;
    });
    final maxPoints = List.generate(
        questionList.length, (index) => questionList[index].maxPoint);
    return [_score, maxPoints, timePercentages];
  }
}
