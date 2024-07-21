import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//AppBar, State, debugShowCheckedModeBanner, etc
void main(){
  runApp(MyApp());
}
//01.
// void main(){
//   runApp(
//     const MaterialApp(
//       title: "Course",
//       home: SafeArea(
//         child: MyApp(),
//       ),
//     )
//   );
// }

class MyApp extends StatelessWidget{
@override
  Widget build(BuildContext context){
  return MaterialApp(
    title: "Scaffold & Appbar",
    debugShowCheckedModeBanner: false,
    home: HomePage(title:"Scaffold & Appbar"),
  );
}
}
class HomePage extends StatefulWidget{
  HomePage({Key? key, this.title}):super(key:key);

  final String? title;

@override
  _HomePageState createState()=> _HomePageState();
  }

  //Definimos el Widget en esta clase, dado en devemos crear por medio del estado, que el boton haga una funcionalidad.
  //De un boton a otro cuando se pulse.
  class _HomePageState extends State<HomePage> {

  Icon _corazon = Icon(Icons.favorite_border, color: Colors.white);
  bool _liked = false;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            title: (Text(widget.title!)),
            actions: [
              IconButton(
                //Funcion si nombre.
                onPressed: (){_likedChange();},
                icon: _corazon,
                tooltip: "Favorite",
              ),
            ]
        ),
      );
    }

    void _likedChange(){
      //Actualizamos el estado, y por ende la pagina
      setState(() {
        if(_liked){
          _corazon = Icon(Icons.favorite_border, color: Colors.white);
          _liked = false;
        }else{
          _corazon = Icon(Icons.favorite, color: Colors.red);
          _liked = true;
        }
      });
  }
  }

// 01.
// class MyApp extends StatelessWidget{
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context){
//     return Material(
//       child: Column(
//         children: [
//           Container(
//             height: 50,
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(color: Colors.blueAccent),
//             child: const Row(
//               children: [
//                 IconButton(
//                   onPressed: null,
//                   icon: Icon(Icons.menu),
//                   tooltip: "Boton de navegación"
//                 ),
//                 Expanded(
//                     child: Text("My First app")
//                 ),
//                 IconButton(
//                     onPressed: null,
//                     icon: Icon(Icons.search),
//                   tooltip: "Boton de busqueda",
//                 )
//               ],
//             ),
//           ),
//           const Expanded(
//             child: Center(
//               child: Text("My first app",
//                 textDirection:TextDirection.ltr,
//               )
//               ,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
