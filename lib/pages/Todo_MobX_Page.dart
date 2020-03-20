import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lista_tarefas_bloc/mobx/todo_mobx.dart';
import 'package:lista_tarefas_bloc/mobx_codegen/todo_mobx_codegen.dart';

class TodoMobXPage extends StatelessWidget {

  final _todoMobX = TodoMobX();
  final _todoMobXCodegen = TodoMobXCodegen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo MobX Page'),
      ),
      body: Center(
        child: Observer(
          builder: (BuildContext context) {
            return ListView.builder(
              itemCount: _todoMobXCodegen.content.length,
              itemBuilder: (BuildContext context, int i){

                      var item = _todoMobXCodegen.content[i];

                      return ListTile(
                        leading: IconButton(
                            icon: Icon(item['status']
                                ? Icons.check_circle
                                : Icons.check_box_outline_blank),
                            onPressed: () => _todoMobXCodegen.toggleStatus(item['id'])),
                        title: Text('#${item['id']} - ${item['title']}'),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete, 
                            color: Colors.red), 
                          onPressed: () => _todoMobXCodegen.remove(item['id'])),
                      );
              },
              );
          },
          ),
      ),
      floatingActionButton: 
      FloatingActionButton(
        onPressed: _todoMobXCodegen.addItem,
        tooltip: 'Add new',
        child: Icon(Icons.add),
        ),
    );
  }
}