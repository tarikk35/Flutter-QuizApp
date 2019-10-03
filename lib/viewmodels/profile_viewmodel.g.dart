// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$ProfileModel on _ProfileModel, Store {
  final _$busyAtom = Atom(name: '_ProfileModel.busy');

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

  final _$userAtom = Atom(name: '_ProfileModel.user');

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

  final _$rankAtom = Atom(name: '_ProfileModel.rank');

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

  final _$resultListAtom = Atom(name: '_ProfileModel.resultList');

  @override
  List<Result> get resultList {
    _$resultListAtom.context.enforceReadPolicy(_$resultListAtom);
    _$resultListAtom.reportObserved();
    return super.resultList;
  }

  @override
  set resultList(List<Result> value) {
    _$resultListAtom.context.conditionallyRunInAction(() {
      super.resultList = value;
      _$resultListAtom.reportChanged();
    }, _$resultListAtom, name: '${_$resultListAtom.name}_set');
  }

  final _$hasErrorAtom = Atom(name: '_ProfileModel.hasError');

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

  final _$getUserAsyncAction = AsyncAction('getUser');

  @override
  Future<dynamic> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$_ProfileModelActionController =
      ActionController(name: '_ProfileModel');

  @override
  void setBusy(bool state) {
    final _$actionInfo = _$_ProfileModelActionController.startAction();
    try {
      return super.setBusy(state);
    } finally {
      _$_ProfileModelActionController.endAction(_$actionInfo);
    }
  }
}
