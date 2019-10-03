// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$LeaderboardModel on _LeaderboardModel, Store {
  final _$busyAtom = Atom(name: '_LeaderboardModel.busy');

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

  final _$isDailyAtom = Atom(name: '_LeaderboardModel.isDaily');

  @override
  bool get isDaily {
    _$isDailyAtom.context.enforceReadPolicy(_$isDailyAtom);
    _$isDailyAtom.reportObserved();
    return super.isDaily;
  }

  @override
  set isDaily(bool value) {
    _$isDailyAtom.context.conditionallyRunInAction(() {
      super.isDaily = value;
      _$isDailyAtom.reportChanged();
    }, _$isDailyAtom, name: '${_$isDailyAtom.name}_set');
  }

  final _$hasErrorAtom = Atom(name: '_LeaderboardModel.hasError');

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

  final _$totalTopHundredAtom = Atom(name: '_LeaderboardModel.totalTopHundred');

  @override
  List<Rank> get totalTopHundred {
    _$totalTopHundredAtom.context.enforceReadPolicy(_$totalTopHundredAtom);
    _$totalTopHundredAtom.reportObserved();
    return super.totalTopHundred;
  }

  @override
  set totalTopHundred(List<Rank> value) {
    _$totalTopHundredAtom.context.conditionallyRunInAction(() {
      super.totalTopHundred = value;
      _$totalTopHundredAtom.reportChanged();
    }, _$totalTopHundredAtom, name: '${_$totalTopHundredAtom.name}_set');
  }

  final _$dailyTopHundredAtom = Atom(name: '_LeaderboardModel.dailyTopHundred');

  @override
  List<Rank> get dailyTopHundred {
    _$dailyTopHundredAtom.context.enforceReadPolicy(_$dailyTopHundredAtom);
    _$dailyTopHundredAtom.reportObserved();
    return super.dailyTopHundred;
  }

  @override
  set dailyTopHundred(List<Rank> value) {
    _$dailyTopHundredAtom.context.conditionallyRunInAction(() {
      super.dailyTopHundred = value;
      _$dailyTopHundredAtom.reportChanged();
    }, _$dailyTopHundredAtom, name: '${_$dailyTopHundredAtom.name}_set');
  }

  final _$currentUserRankAtom = Atom(name: '_LeaderboardModel.currentUserRank');

  @override
  Rank get currentUserRank {
    _$currentUserRankAtom.context.enforceReadPolicy(_$currentUserRankAtom);
    _$currentUserRankAtom.reportObserved();
    return super.currentUserRank;
  }

  @override
  set currentUserRank(Rank value) {
    _$currentUserRankAtom.context.conditionallyRunInAction(() {
      super.currentUserRank = value;
      _$currentUserRankAtom.reportChanged();
    }, _$currentUserRankAtom, name: '${_$currentUserRankAtom.name}_set');
  }

  final _$currentUserDailyRankAtom =
      Atom(name: '_LeaderboardModel.currentUserDailyRank');

  @override
  Rank get currentUserDailyRank {
    _$currentUserDailyRankAtom.context
        .enforceReadPolicy(_$currentUserDailyRankAtom);
    _$currentUserDailyRankAtom.reportObserved();
    return super.currentUserDailyRank;
  }

  @override
  set currentUserDailyRank(Rank value) {
    _$currentUserDailyRankAtom.context.conditionallyRunInAction(() {
      super.currentUserDailyRank = value;
      _$currentUserDailyRankAtom.reportChanged();
    }, _$currentUserDailyRankAtom,
        name: '${_$currentUserDailyRankAtom.name}_set');
  }

  final _$getTotalRankingsAsyncAction = AsyncAction('getTotalRankings');

  @override
  Future<dynamic> getTotalRankings() {
    return _$getTotalRankingsAsyncAction.run(() => super.getTotalRankings());
  }

  final _$getDailyRankingsAsyncAction = AsyncAction('getDailyRankings');

  @override
  Future<dynamic> getDailyRankings() {
    return _$getDailyRankingsAsyncAction.run(() => super.getDailyRankings());
  }

  final _$_LeaderboardModelActionController =
      ActionController(name: '_LeaderboardModel');

  @override
  void setBusy(bool state) {
    final _$actionInfo = _$_LeaderboardModelActionController.startAction();
    try {
      return super.setBusy(state);
    } finally {
      _$_LeaderboardModelActionController.endAction(_$actionInfo);
    }
  }
}
