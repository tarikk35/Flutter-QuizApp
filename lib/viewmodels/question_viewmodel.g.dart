// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$QuestionModel on _QuestionModel, Store {
  final _$busyAtom = Atom(name: '_QuestionModel.busy');

  @override
  bool get busy {
    _$busyAtom.context.enforceReadPolicy(_$busyAtom);
    _$busyAtom.reportObserved();
    return super.busy;
  }

  @override
  set busy(bool value) {
    _$busyAtom.context.conditionallyRunInAction(() {
      super.busy = value;
      _$busyAtom.reportChanged();
    }, _$busyAtom, name: '${_$busyAtom.name}_set');
  }

  final _$isAnsweredAtom = Atom(name: '_QuestionModel.isAnswered');

  @override
  bool get isAnswered {
    _$isAnsweredAtom.context.enforceReadPolicy(_$isAnsweredAtom);
    _$isAnsweredAtom.reportObserved();
    return super.isAnswered;
  }

  @override
  set isAnswered(bool value) {
    _$isAnsweredAtom.context.conditionallyRunInAction(() {
      super.isAnswered = value;
      _$isAnsweredAtom.reportChanged();
    }, _$isAnsweredAtom, name: '${_$isAnsweredAtom.name}_set');
  }

  final _$hasErrorAtom = Atom(name: '_QuestionModel.hasError');

  @override
  bool get hasError {
    _$hasErrorAtom.context.enforceReadPolicy(_$hasErrorAtom);
    _$hasErrorAtom.reportObserved();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.context.conditionallyRunInAction(() {
      super.hasError = value;
      _$hasErrorAtom.reportChanged();
    }, _$hasErrorAtom, name: '${_$hasErrorAtom.name}_set');
  }

  final _$scoresAtom = Atom(name: '_QuestionModel.scores');

  @override
  List get scores {
    _$scoresAtom.context.enforceReadPolicy(_$scoresAtom);
    _$scoresAtom.reportObserved();
    return super.scores;
  }

  @override
  set scores(List value) {
    _$scoresAtom.context.conditionallyRunInAction(() {
      super.scores = value;
      _$scoresAtom.reportChanged();
    }, _$scoresAtom, name: '${_$scoresAtom.name}_set');
  }

  final _$questionListAtom = Atom(name: '_QuestionModel.questionList');

  @override
  List<Question> get questionList {
    _$questionListAtom.context.enforceReadPolicy(_$questionListAtom);
    _$questionListAtom.reportObserved();
    return super.questionList;
  }

  @override
  set questionList(List<Question> value) {
    _$questionListAtom.context.conditionallyRunInAction(() {
      super.questionList = value;
      _$questionListAtom.reportChanged();
    }, _$questionListAtom, name: '${_$questionListAtom.name}_set');
  }

  final _$currentQuestionAtom = Atom(name: '_QuestionModel.currentQuestion');

  @override
  Question get currentQuestion {
    _$currentQuestionAtom.context.enforceReadPolicy(_$currentQuestionAtom);
    _$currentQuestionAtom.reportObserved();
    return super.currentQuestion;
  }

  @override
  set currentQuestion(Question value) {
    _$currentQuestionAtom.context.conditionallyRunInAction(() {
      super.currentQuestion = value;
      _$currentQuestionAtom.reportChanged();
    }, _$currentQuestionAtom, name: '${_$currentQuestionAtom.name}_set');
  }

  final _$countdownAtom = Atom(name: '_QuestionModel.countdown');

  @override
  double get countdown {
    _$countdownAtom.context.enforceReadPolicy(_$countdownAtom);
    _$countdownAtom.reportObserved();
    return super.countdown;
  }

  @override
  set countdown(double value) {
    _$countdownAtom.context.conditionallyRunInAction(() {
      super.countdown = value;
      _$countdownAtom.reportChanged();
    }, _$countdownAtom, name: '${_$countdownAtom.name}_set');
  }

  final _$markQuestionAsyncAction = AsyncAction('markQuestion');

  @override
  Future<dynamic> markQuestion({dynamic answer}) {
    return _$markQuestionAsyncAction
        .run(() => super.markQuestion(answer: answer));
  }

  final _$getQuestionsAsyncAction = AsyncAction('getQuestions');

  @override
  Future<dynamic> getQuestions(String quizId) {
    return _$getQuestionsAsyncAction.run(() => super.getQuestions(quizId));
  }

  final _$_QuestionModelActionController =
      ActionController(name: '_QuestionModel');

  @override
  void setBusy(bool state) {
    final _$actionInfo = _$_QuestionModelActionController.startAction();
    try {
      return super.setBusy(state);
    } finally {
      _$_QuestionModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAnswered(dynamic state) {
    final _$actionInfo = _$_QuestionModelActionController.startAction();
    try {
      return super.setAnswered(state);
    } finally {
      _$_QuestionModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetTotalScore() {
    final _$actionInfo = _$_QuestionModelActionController.startAction();
    try {
      return super.resetTotalScore();
    } finally {
      _$_QuestionModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextQuestion() {
    final _$actionInfo = _$_QuestionModelActionController.startAction();
    try {
      return super.nextQuestion();
    } finally {
      _$_QuestionModelActionController.endAction(_$actionInfo);
    }
  }
}
