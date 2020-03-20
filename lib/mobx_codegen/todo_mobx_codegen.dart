import 'package:mobx/mobx.dart';
part 'todo_mobx_codegen.g.dart';

class TodoMobXCodegen = TodoMobXCodegenBase with _$TodoMobXCodegen;

abstract class TodoMobXCodegenBase with Store {
  TodoMobXCodegenBase(){
    addItem();
  }

  int _id = 0;
  
  @observable
  ObservableList content = ObservableList();

  @action
  addItem(){
    Map<String, dynamic> item = {
      'id': _id++,
      'title': 'Beber água',
      'status': false,
    };

    content.add(item);
  }

  @action
  toggleStatus(int id){
    var item = content.where((o) => o['id'] == id).first;
    item['status'] = !item['status'];
    content.sort((a, b){
      if (a['id'] == b['id']){
        return 0;
      }
      return a['id'] > b['id'] ? 1 : -1;
    });
  }

  @action
  remove(int id){
    content.where((item) => item['id'] == id);
  }
}