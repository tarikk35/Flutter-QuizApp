// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$SettingsModel on _LoginModel, Store {
  final _$busyAtom = Atom(name: '_LoginModel.busy');

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

  final _$selectedIconAtom = Atom(name: '_LoginModel.selectedIcon');

  @override
  int get selectedIcon {
    _$selectedIconAtom.context.enforceReadPolicy(_$selectedIconAtom);
    _$selectedIconAtom.reportObserved();
    return super.selectedIcon;
  }

  @override
  set selectedIcon(int value) {
    _$selectedIconAtom.context.conditionallyRunInAction(() {
      super.selectedIcon = value;
      _$selectedIconAtom.reportChanged();
    }, _$selectedIconAtom, name: '${_$selectedIconAtom.name}_set');
  }

  final _$changeAvatarAsyncAction = AsyncAction('changeAvatar');

  @override
  Future<dynamic> changeAvatar(dynamic avatarId) {
    return _$changeAvatarAsyncAction.run(() => super.changeAvatar(avatarId));
  }

  final _$setIconToPrefsAsyncAction = AsyncAction('setIconToPrefs');

  @override
  Future<dynamic> setIconToPrefs(String iconid) {
    return _$setIconToPrefsAsyncAction.run(() => super.setIconToPrefs(iconid));
  }

  final _$getIconFromPrefsAsyncAction = AsyncAction('getIconFromPrefs');

  @override
  Future<dynamic> getIconFromPrefs() {
    return _$getIconFromPrefsAsyncAction.run(() => super.getIconFromPrefs());
  }

  final _$logoutAsyncAction = AsyncAction('logout');

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }
}
