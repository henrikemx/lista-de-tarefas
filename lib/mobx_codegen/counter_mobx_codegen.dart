import 'package:mobx/mobx.dart';

part 'counter_mobx_codegen.g.dart';

class CounterMobXCodegen = CounterMobXCodegenBase with _$CounterMobXCodegen;

abstract class CounterMobXCodegenBase with Store {
  @observable
  int counter = 0;

  @action
  void increment(){
    counter++;
  }

  @action
  void decrement(){
    counter--;
  }

}