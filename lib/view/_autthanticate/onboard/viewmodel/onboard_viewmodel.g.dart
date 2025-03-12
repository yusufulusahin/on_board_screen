// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboard_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OnboardViewModel on _OnboardViewModelBase, Store {
  late final _$currentindexAtom =
      Atom(name: '_OnboardViewModelBase.currentindex', context: context);

  @override
  int get currentindex {
    _$currentindexAtom.reportRead();
    return super.currentindex;
  }

  @override
  set currentindex(int value) {
    _$currentindexAtom.reportWrite(value, super.currentindex, () {
      super.currentindex = value;
    });
  }

  late final _$_OnboardViewModelBaseActionController =
      ActionController(name: '_OnboardViewModelBase', context: context);

  @override
  void changeCurrentIndex(int value) {
    final _$actionInfo = _$_OnboardViewModelBaseActionController.startAction(
        name: '_OnboardViewModelBase.changeCurrentIndex');
    try {
      return super.changeCurrentIndex(value);
    } finally {
      _$_OnboardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentindex: ${currentindex}
    ''';
  }
}
