// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$CategoryModel on _CategoryModel, Store {
  Computed<String> _$categoryIdComputed;

  @override
  String get categoryId =>
      (_$categoryIdComputed ??= Computed<String>(() => super.categoryId)).value;
  Computed<List<Quiz>> _$quizzesComputed;

  @override
  List<Quiz> get quizzes =>
      (_$quizzesComputed ??= Computed<List<Quiz>>(() => super.quizzes)).value;

  final _$selectedQuizAtom = Atom(name: '_CategoryModel.selectedQuiz');

  @override
  Quiz get selectedQuiz {
    _$selectedQuizAtom.context.enforceReadPolicy(_$selectedQuizAtom);
    _$selectedQuizAtom.reportObserved();
    return super.selectedQuiz;
  }

  @override
  set selectedQuiz(Quiz value) {
    _$selectedQuizAtom.context.conditionallyRunInAction(() {
      super.selectedQuiz = value;
      _$selectedQuizAtom.reportChanged();
    }, _$selectedQuizAtom, name: '${_$selectedQuizAtom.name}_set');
  }

  final _$hasErrorAtom = Atom(name: '_CategoryModel.hasError');

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

  final _$topThreeUserListAtom = Atom(name: '_CategoryModel.topThreeUserList');

  @override
  List<Rank> get topThreeUserList {
    _$topThreeUserListAtom.context.enforceReadPolicy(_$topThreeUserListAtom);
    _$topThreeUserListAtom.reportObserved();
    return super.topThreeUserList;
  }

  @override
  set topThreeUserList(List<Rank> value) {
    _$topThreeUserListAtom.context.conditionallyRunInAction(() {
      super.topThreeUserList = value;
      _$topThreeUserListAtom.reportChanged();
    }, _$topThreeUserListAtom, name: '${_$topThreeUserListAtom.name}_set');
  }

  final _$participantsAtom = Atom(name: '_CategoryModel.participants');

  @override
  int get participants {
    _$participantsAtom.context.enforceReadPolicy(_$participantsAtom);
    _$participantsAtom.reportObserved();
    return super.participants;
  }

  @override
  set participants(int value) {
    _$participantsAtom.context.conditionallyRunInAction(() {
      super.participants = value;
      _$participantsAtom.reportChanged();
    }, _$participantsAtom, name: '${_$participantsAtom.name}_set');
  }

  final _$successRateAtom = Atom(name: '_CategoryModel.successRate');

  @override
  double get successRate {
    _$successRateAtom.context.enforceReadPolicy(_$successRateAtom);
    _$successRateAtom.reportObserved();
    return super.successRate;
  }

  @override
  set successRate(double value) {
    _$successRateAtom.context.conditionallyRunInAction(() {
      super.successRate = value;
      _$successRateAtom.reportChanged();
    }, _$successRateAtom, name: '${_$successRateAtom.name}_set');
  }

  final _$categoryBusyAtom = Atom(name: '_CategoryModel.categoryBusy');

  @override
  bool get categoryBusy {
    _$categoryBusyAtom.context.enforceReadPolicy(_$categoryBusyAtom);
    _$categoryBusyAtom.reportObserved();
    return super.categoryBusy;
  }

  @override
  set categoryBusy(bool value) {
    _$categoryBusyAtom.context.conditionallyRunInAction(() {
      super.categoryBusy = value;
      _$categoryBusyAtom.reportChanged();
    }, _$categoryBusyAtom, name: '${_$categoryBusyAtom.name}_set');
  }

  final _$quizBusyAtom = Atom(name: '_CategoryModel.quizBusy');

  @override
  bool get quizBusy {
    _$quizBusyAtom.context.enforceReadPolicy(_$quizBusyAtom);
    _$quizBusyAtom.reportObserved();
    return super.quizBusy;
  }

  @override
  set quizBusy(bool value) {
    _$quizBusyAtom.context.conditionallyRunInAction(() {
      super.quizBusy = value;
      _$quizBusyAtom.reportChanged();
    }, _$quizBusyAtom, name: '${_$quizBusyAtom.name}_set');
  }

  final _$setQuizAsyncAction = AsyncAction('setQuiz');

  @override
  Future<dynamic> setQuiz(int index) {
    return _$setQuizAsyncAction.run(() => super.setQuiz(index));
  }

  final _$setCategoryAsyncAction = AsyncAction('setCategory');

  @override
  Future<dynamic> setCategory(String categoryid) {
    return _$setCategoryAsyncAction.run(() => super.setCategory(categoryid));
  }

  final _$_CategoryModelActionController =
      ActionController(name: '_CategoryModel');

  @override
  void setCategoryBusy(bool state) {
    final _$actionInfo = _$_CategoryModelActionController.startAction();
    try {
      return super.setCategoryBusy(state);
    } finally {
      _$_CategoryModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuizBusy(bool state) {
    final _$actionInfo = _$_CategoryModelActionController.startAction();
    try {
      return super.setQuizBusy(state);
    } finally {
      _$_CategoryModelActionController.endAction(_$actionInfo);
    }
  }
}
