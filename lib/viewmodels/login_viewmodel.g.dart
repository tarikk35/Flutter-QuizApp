// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$LoginViewModel on _LoginViewModel, Store {
  final _$busyAtom = Atom(name: '_LoginViewModel.busy');

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

  final _$isLoggedInAtom = Atom(name: '_LoginViewModel.isLoggedIn');

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.context.enforceReadPolicy(_$isLoggedInAtom);
    _$isLoggedInAtom.reportObserved();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.context.conditionallyRunInAction(() {
      super.isLoggedIn = value;
      _$isLoggedInAtom.reportChanged();
    }, _$isLoggedInAtom, name: '${_$isLoggedInAtom.name}_set');
  }

  final _$hasErrorAtom = Atom(name: '_LoginViewModel.hasError');

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

  final _$autoLoginAsyncAction = AsyncAction('autoLogin');

  @override
  Future<dynamic> autoLogin() {
    return _$autoLoginAsyncAction.run(() => super.autoLogin());
  }

  final _$loginWithFacebookAsyncAction = AsyncAction('loginWithFacebook');

  @override
  Future<dynamic> loginWithFacebook() {
    return _$loginWithFacebookAsyncAction.run(() => super.loginWithFacebook());
  }

  final _$loginWithGoogleAsyncAction = AsyncAction('loginWithGoogle');

  @override
  Future<dynamic> loginWithGoogle() {
    return _$loginWithGoogleAsyncAction.run(() => super.loginWithGoogle());
  }

  final _$_LoginViewModelActionController =
      ActionController(name: '_LoginViewModel');

  @override
  void setBusy(bool state) {
    final _$actionInfo = _$_LoginViewModelActionController.startAction();
    try {
      return super.setBusy(state);
    } finally {
      _$_LoginViewModelActionController.endAction(_$actionInfo);
    }
  }
}
