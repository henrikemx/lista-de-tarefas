import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lista_tarefas_bloc/mobx/counter_mobx.dart';
import 'package:lista_tarefas_bloc/mobx/counter_mobx_codegen.dart';
import 'bloc/counter_bloc.dart';
import 'pages/ToDo_Bloc_Page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Thizer: App ToDo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Curso de Flutter - 05 (Thizer)'),
        routes: <String, WidgetBuilder>{
          '/todo-bloc-page': (context) => ToDoBlocPage(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc _counterBloc = CounterBloc();
  CounterMobX _counterMobX = CounterMobX();
  CounterMobXCodegen _counterMobXCodegen = CounterMobXCodegen();

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Número de vezes em que tocou no botão:',
            ),

            // Este é um Bloc
            // StreamBuilder(
            //   stream: _counterBloc.output,
            //   builder: ((BuildContext context, AsyncSnapshot snapshot) {
            //     if (snapshot.hasError) {
            //       return Text('Error: ${snapshot.error}');
            //     }
            //     switch (snapshot.connectionState) {
            //       case ConnectionState.waiting:
            //         return CircularProgressIndicator();
            //       default:
            //         // aqui exibe, no console, o valor do contador
            //         print(snapshot.data);

            //         // aqui retorna, na tela, um número incremental
            //         return Text(
            //           snapshot.data.toString(),
            //           // '${snapshot.data}',
            //           style: TextStyle(fontSize: 34),
            //         );
            //     }
            //   }),
            // ),

            // Código em MobX
            Observer(
              builder: (BuildContext context) {
                return Text(
                  _counterMobXCodegen.counter.toString(),
                  style: TextStyle(fontSize: 34),
                );
              },
            ),
            SizedBox(height: 10),
            RaisedButton(
                child: Text('Todo Bloc Page'),
                color: Colors.amber,
                onPressed: () {
                  Navigator.of(context).pushNamed('/todo-bloc-page');
                }),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: null,
            onPressed: _counterMobXCodegen.decrement,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: _counterMobXCodegen.increment,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
