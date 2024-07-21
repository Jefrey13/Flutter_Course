import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Buttons(ElevatedButton, floatingActionButton, )
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Scaffold & Appbar",
      debugShowCheckedModeBanner: false,
      home: HomePage(title: "Scaffold & Appbar"),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String clickedBotton = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text(widget.title!)),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('El boton es: '),
            Text(
              clickedBotton,
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Padding(padding: EdgeInsets.all(20)),
            ElevatedButton(
              onPressed: _elevatorClickedBotton,
              child: Text("ElevatedButton"),
              style: ElevatedButton.styleFrom(
                  elevation: 10,
                  backgroundColor: Colors.amber,
                  shadowColor: Colors.black12),
            ),
            Padding(padding: EdgeInsets.all(10)),
            TextButton(
                onPressed: _flatClickedBotton,
                child: Text("Text Button"),
                style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ))),
            Padding(padding: EdgeInsets.all(10)),
            IconButton(
              onPressed: _iconClickedBotton,
              icon: Icon(Icons.accessibility),
              color: Colors.blueAccent,
              iconSize: 30,
            ),
            Padding(padding: EdgeInsets.all(10)),
            Ink(
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                color: Colors.lightBlue,
              ),
              child: IconButton(
                onPressed: _iconClickedBotton,
                icon: Icon(Icons.accessibility),
                color: Colors.blueAccent,
                iconSize: 30,
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            OutlinedButton(
                onPressed: _outClickedBotton,
                child: Text(
                  "PutlineBotton",
                  style: TextStyle(
                    color: Colors.lightBlue,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    width: 1,
                    color: Colors.blueAccent,
                    style: BorderStyle.solid,
                  ),
                )),
            const Padding(padding: EdgeInsets.all(10)),
            CupertinoButton(
                child: Text("Cupertino Botton"),
                onPressed: _cupertinoClickedBotton,
              color: Colors.greenAccent,
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _clickedFloting,
        tooltip: "Pulsame",
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  void _clickedFloting() {
    _queBoton('flo');
  }

  void _elevatorClickedBotton() {
    _queBoton('ele');
  }

  void _flatClickedBotton() {
    _queBoton('text');
  }

  void _iconClickedBotton() {
    _queBoton('icon');
  }

  void _outClickedBotton() {
    _queBoton('out');
  }

  void _cupertinoClickedBotton() {
    _queBoton('cup');
  }

  void _queBoton(String boton) {
    setState(() {
      switch (boton) {
        case 'flo':
          clickedBotton = "Floating Action Button";
          break;
        case 'ele':
          clickedBotton = "Elevator Button";
          break;
        case 'text':
          clickedBotton = "Flat Button";
          break;
        case 'icon':
          clickedBotton = "Icon Button";
          break;
        case 'out':
          clickedBotton = "Outline Button";
          break;
        case 'cup':
          clickedBotton = "Cupertino Button";
          break;
      }
    });
  }
}
