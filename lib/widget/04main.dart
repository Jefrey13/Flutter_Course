import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//setState, bottomNavigationBar, body, drawer, etc
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
  int _seleccionado = 0;
  String textoVisualizar = "0: Home";

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
      drawer: const Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: Text("Menu",
                style: TextStyle(
                  color: Colors.black12,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),))
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(textoVisualizar,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
            onPressed: (){_likedChange();},
            label: Text("Like"),
            backgroundColor: Colors.red,
            icon: _corazon
        ),
        //Se accede por medio INIDICE 0...
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blueAccent,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home,
                color: Colors.white,
                ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle,
                  color: Colors.white,
                ),
              label: "Account",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment,
                color: Colors.white,
              ),
              label: "Tareas",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications,
                color: Colors.white,
              ),
              label: "Notificaciones",
            ),
          ],
          currentIndex: _seleccionado,
          onTap: Seleccionar,
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
  void Seleccionar(int index){
    setState(() {
      _seleccionado = index;

      switch(_seleccionado){
        case 0:
          textoVisualizar = '$_seleccionado : "Home"}';
          break;
        case 1:
          textoVisualizar = '$_seleccionado : "Account"}';
          break;
        case 2:
          textoVisualizar = '$_seleccionado : "Tareas"}';
          break;
        case 3:
          textoVisualizar = '$_seleccionado : "Notificaciones"}';
          break;
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
