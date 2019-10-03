// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endscreen_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$EndscreenModel on _EndscreenModel, Store {
  final _$busyAtom = Atom(name: '_EndscreenModel.busy');

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

  final _$rankAtom = Atom(name: '_EndscreenModel.rank');

  @override
  int get rank {
    _$rankAtom.context.enforceReadPolicy(_$rankAtom);
    _$rankAtom.reportObserved();
    return super.rank;
  }

  @override
  set rank(int value) {
    _$rankAtom.context.conditionallyRunInAction(() {
      super.rank = value;
      _$rankAtom.reportChanged();
    }, _$rankAtom, name: '${_$rankAtom.name}_set');
  }

  final _$hasErrorAtom = Atom(name: '_EndscreenModel.hasError');

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

  final _$userAtom = Atom(name: '_EndscreenModel.user');

  @override
  User get user {
    _$userAtom.context.enforceReadPolicy(_$userAtom);
    _$userAtom.reportObserved();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.context.conditionallyRunInAction(() {
      super.user = value;
      _$userAtom.reportChanged();
    }, _$userAtom, name: '${_$userAtom.name}_set');
  }

  final _$answersAtom = Atom(name: '_EndscreenModel.answers');

  @override
  List<int> get answers {
    _$answersAtom.context.enforceReadPolicy(_$answersAtom);
    _$answersAtom.reportObserved();
    return super.answers;
  }

  @override
  set answers(List<int> value) {
    _$answersAtom.context.conditionallyRunInAction(() {
      super.answers = value;
      _$answersAtom.reportChanged();
    }, _$answersAtom, name: '${_$answersAtom.name}_set');
  }

  final _$scoreAtom = Atom(name: '_EndscreenModel.score');

  @override
  int get score {
    _$scoreAtom.context.enforceReadPolicy(_$scoreAtom);
    _$scoreAtom.reportObserved();
    return super.score;
  }

  @override
  set score(int value) {
    _$scoreAtom.context.conditionallyRunInAction(() {
      super.score = value;
      _$scoreAtom.reportChanged();
    }, _$scoreAtom, name: '${_$scoreAtom.name}_set');
  }

  final _$getRankAsyncAction = AsyncAction('getRank');

  @override
  Future<dynamic> getRank() {
    return _$getRankAsyncAction.run(() => super.getRank());
  }

  final _$_EndscreenModelActionController =
      ActionController(name: '_EndscreenModel');

  @override
  void setBusy(bool state) {
    final _$actionInfo = _$_EndscreenModelActionController.startAction();
    try {
      return super.setBusy(state);
    } finally {
      _$_EndscreenModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAnswers(List<int> answers) {
    final _$actionInfo = _$_EndscreenModelActionController.startAction();
    try {
      return super.setAnswers(answers);
    } finally {
      _$_EndscreenModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateScore(List<int> scoreList, List<double> timePercentages,
      List<double> maxPoints) {
    final _$actionInfo = _$_EndscreenModelActionController.startAction();
    try {
      return super.calculateScore(scoreList, timePercentages, maxPoints);
    } finally {
      _$_EndscreenModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUser(String userId) {
    final _$actionInfo = _$_EndscreenModelActionController.startAction();
    try {
      return super.setUser(userId);
    } finally {
      _$_EndscreenModelActionController.endAction(_$actionInfo);
    }
  }
}
