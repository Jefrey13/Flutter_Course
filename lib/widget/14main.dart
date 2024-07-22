import 'package:flutter/material.dart';
import 'package:fluttercourse/widget/contador_provider.dart';
import 'package:provider/provider.dart';
//Provider: Para gestionar toda la logica de programacion separada de la parte visual
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Provider",
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      home: ChangeNotifierProvider(
        create: (_)=> ContadorProvider(0),
        child: HomePage(title: "Provider & State",),
      )
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {

    //Creamos una instancia de la clase
    final _counterProvider = Provider.of<ContadorProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("You have pushed the button this many times: "),
            Text('${_counterProvider.counter}',
            style: Theme.of(context).textTheme.headlineMedium,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _counterProvider.increment,
        tooltip: "Increment",
      ),
    );
  }

}
