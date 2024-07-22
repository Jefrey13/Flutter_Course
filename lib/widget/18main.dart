import 'package:flutter/material.dart';

// SimpleDialog. Elegir entre una serie de opciones
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "SimpleDialog",
      debugShowCheckedModeBanner: false,
      home: HomePage(title: "SimpleDialog"),
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
  String _opcion = 'Ninguna';

  Future<void> _elegirOpcion() async {
    final seleccion = await showDialog<ListaOpciones>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text("Seleccione una opción de transporte"),
          children: [
            SimpleDialogOption(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.directions_car),
                  const SizedBox(width: 10),
                  const Text("Coche")
                ],
              ),
              onPressed: () {
                Navigator.pop(context, ListaOpciones.Coche);
              },
            ),
            SimpleDialogOption(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.airplane_ticket_outlined),
                  const SizedBox(width: 10),
                  const Text("Avión")
                ],
              ),
              onPressed: () {
                Navigator.pop(context, ListaOpciones.Avion);
              },
            ),
            SimpleDialogOption(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.directions_boat),
                  const SizedBox(width: 10),
                  const Text("Barco")
                ],
              ),
              onPressed: () {
                Navigator.pop(context, ListaOpciones.Barco);
              },
            ),
          ],
        );
      },
    );

    if (seleccion != null) {
      _opcionElegida(seleccion);
    }
  }

  void _opcionElegida(ListaOpciones opcion) {
    setState(() {
      switch (opcion) {
        case ListaOpciones.Coche:
          _opcion = "Coche";
          break;
        case ListaOpciones.Avion:
          _opcion = "Avion";
          break;
        case ListaOpciones.Barco:
          _opcion = "Barco";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _elegirOpcion,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                textStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
              child: const Text("Abrir SimpleDialog"),
            ),
            const Padding(padding: EdgeInsets.all(15)),
            const Text(
              "La elección es:",
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 20,
              ),
            ),
            const Padding(padding: EdgeInsets.all(15)),
            Text(
              _opcion,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum ListaOpciones {
  Coche,
  Avion,
  Barco,
}