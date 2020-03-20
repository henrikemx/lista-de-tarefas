// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_mobx_codegen.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CounterMobXCodegen on CounterMobXCodegenBase, Store {
  final _$counterAtom = Atom(name: 'CounterMobXCodegenBase.counter');

  @override
  int get counter {
    _$counterAtom.context.enforceReadPolicy(_$counterAtom);
    _$counterAtom.reportObserved();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.context.conditionallyRunInAction(() {
      super.counter = value;
      _$counterAtom.reportChanged();
    }, _$counterAtom, name: '${_$counterAtom.name}_set');
  }

  final _$CounterMobXCodegenBaseActionController =
      ActionController(name: 'CounterMobXCodegenBase');

  @override
  void increment() {
    final _$actionInfo = _$CounterMobXCodegenBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$CounterMobXCodegenBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$CounterMobXCodegenBaseActionController.startAction();
    try {
      return super.decrement();
    } finally {
      _$CounterMobXCodegenBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'counter: ${counter.toString()}';
    return '{$string}';
  }
}
