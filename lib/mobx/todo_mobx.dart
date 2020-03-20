import 'package:mobx/mobx.dart';

class TodoMobX {

  TodoMobX(){
    addItem = Action(_addItem);
    toggleStatus = Action(_toggleStatus);
    remove = Action(_remove);
    _addItem();
  }

  int _id = 0;

  ObservableList content = ObservableList();

  Action addItem;
  Action toggleStatus;
  Action remove;

  void _addItem(){
    Map<String, dynamic> item = {
      'id': _id++,
      'title': 'Beber água',
      'status': false,
    };

    content.add(item);
  }

  void _toggleStatus(int id){
    var item = content.where((o) => o['id'] == id).first;
    item['status'] = !item['status'];
    content.sort((a, b){
      if (a['id'] == b['id']){
        return 0;
      }
      return a['id'] > b['id'] ? 1 : -1;
    });
  }

  void _remove(int id){
    content.where((item) => item['id'] == id);
  }
}