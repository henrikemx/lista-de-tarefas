import 'package:flutter/material.dart';
import 'package:lista_tarefas_bloc/bloc/todo_bloc.dart';

class ToDoBlocPage extends StatefulWidget {
  @override
  _ToDoBlocPageState createState() => _ToDoBlocPageState();
}

class _ToDoBlocPageState extends State<ToDoBlocPage> {
  TodoBloc todoBloc = TodoBloc();

  @override
  void dispose() {
    super.dispose();
    todoBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo Bloc Page'),
      ),
      body: Center(
        child: StreamBuilder(
            stream: todoBloc.output,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                default:

                  if (snapshot.data.length == 0){
                    return Text('Sem dados para exibir',
                    style: TextStyle(
                      fontSize: 22,
                    ),);
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int i) {
                      Map<String, dynamic> item = snapshot.data[i];
                      return ListTile(
                        leading: IconButton(
                            icon: Icon(item['status']
                                ? Icons.check_circle
                                : Icons.check_box_outline_blank),
                            onPressed: () => todoBloc.toggleStatus(item['id'])),
                        title: Text('#${item['id']} - ${item['title']}'),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete, 
                            color: Colors.red), 
                          onPressed: () => todoBloc.remove(item['id'])),
                      );
                    },
                  );
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: todoBloc.addItem,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),    );
  }
}
