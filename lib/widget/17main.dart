import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//AlertDialog & Cupertino Alertdialog. Dentro del Scaffold, por que necesita el contexto.
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "AlertDialog & Cupertino Alertdialog",
      debugShowCheckedModeBanner: false,
      home: HomePage(title: "AlertDialog & Cupertino Alertdialog"),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text(title!)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        title: Text("Alerta de compra"),
                        content: Text("Si no desea comprar, puede cerra"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Cerra"))
                        ],
                      );
                    });
              },
              child: Text("Abrir Alertdialog"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                  textStyle: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return CupertinoAlertDialog(
                        title: Text("Cupertino alert"),
                        content: Text("All content need to be in this space"),
                        actions: [
                          TextButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text("Cerrar")
                          )
                        ],
                      );
                    });
              },
              child: Text("Abrir Cupertino Alertdialog"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  textStyle: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
