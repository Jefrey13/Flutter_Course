import 'package:flutter/material.dart';

//Snackbar (NEcesitamos simpre el CONTEXTO)
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Snackbar",
      debugShowCheckedModeBanner: false,
      home: HomePage(title: "Snackbar"),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.title}) : super(key: key);

  final String? title;
//Creamos el snackbar fuera del WIDGET. Pero no se puede agregar acciones
  final SnackBar _snackbar = const SnackBar(
      content: Text("Ejemplo de snackbar"),
    duration: Duration(seconds: 4),
    backgroundColor: Colors.black26,
  );
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
                onPressed: (){
                  //ScaffoldMessenger.of(context).showSnackBar(_snackbar);
                  ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(
                       content: Text("Ejemplode snackbar con acciones"),
                     duration: Duration(seconds: 4),
                     backgroundColor: Colors.greenAccent,
                     margin: EdgeInsets.all(10),
                     behavior: SnackBarBehavior.floating,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10),
                     ),
                     action: SnackBarAction(
                       label:"Cerrar",
                       textColor: Colors.white,
                       onPressed: (){
                         ScaffoldMessenger.of(context).hideCurrentSnackBar();
                       },
                     ),
                   )
                  );
                },
                child: Text("Abrir Snackabr"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black26,
                  textStyle: TextStyle(
                    color: Colors.white,
                  )
                ),
            )
          ],
        ),
      ),

    );
  }
}
