import 'dart:core';
import 'dart:math';
import 'package:flutter/material.dart';

// Stateless & Stateful

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stateful",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

/* Creamos esta clase y no agregamos directamente el scaffold,
   Es por que si ahora se requiere hacer mas cosas y necesitamos que tenga
   esta estructura para que todo cuelgue directamente de material app, por que ahora
   vamos a empezar a utilizar widgets y los widgets necesitan  colgar de material app
   o uno de estos lienzos que explicamos al principios.
*/

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String title = 'Color App';
  Color color = Colors.redAccent;

  int _red = 0;
  int _blue = 0;
  int _green = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("El color actual es: "),
            Container(
              color: color,
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.7,
              alignment: Alignment.center,
              child: Text(
                'R (${color.red}), G (${color.green}), B (${color.blue})',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _changeColor,
        backgroundColor: color,
      ),
    );
  }

  void _changeColor() {
    _red = Random.secure().nextInt(256);
    _green = Random.secure().nextInt(256);
    _blue = Random.secure().nextInt(256);

    setState(() {
      color = Color.fromRGBO(_red, _green, _blue, 1);
    });
  }
}
