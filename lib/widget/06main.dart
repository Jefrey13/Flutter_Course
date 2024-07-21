import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Verification Android or IOS
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
  Icon _corazon = const Icon(
    Icons.favorite_border,
    color: Colors.redAccent,
  );
  bool _liked = false;
  int _seleccionado = 0;
  String _textoVisualizar = "0: Home";

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? Material() : Cupertino();
  }

  Widget Material() {
    return Scaffold(
      appBar: AppBar(
        title: (Text(widget.title!)),
        actions: [
          IconButton(
            onPressed: () {
              _likedChange();
            },
            icon: _corazon,
            tooltip: "Favorite",
          ),
        ],
      ),
      drawer: const Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: Text(
              "Menu",
              style: TextStyle(
                color: Colors.black38,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ))
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _textoVisualizar,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _likedChange();
        },
        label: const Text("Like"),
        backgroundColor: Colors.redAccent,
        icon: _corazon,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notification_add), label: "Notification"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: "Account")
        ],
        currentIndex: _seleccionado,
        onTap: Seleccionar,
      ),
    );
  }

  Widget Cupertino() {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.black38,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        middle: Text(
          "Titulo de pagina",
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon( Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "IOS",
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _likedChange() {
    setState(() {
      if (_liked) {
        _corazon = const Icon(
          Icons.favorite_border,
          color: Colors.white,
        );
        _liked = false;
      } else {
        _corazon = const Icon(
          Icons.favorite_border,
          color: Colors.redAccent,
        );
        _liked = true;
      }
    });
  }

  void Seleccionar(int index) {
    setState(() {
      _seleccionado = index;

      switch (_seleccionado) {
        case 0:
          _textoVisualizar = '$_seleccionado : "Home"}';
          break;
        case 1:
          _textoVisualizar = '$_seleccionado : "Account"}';
          break;
        case 2:
          _textoVisualizar = '$_seleccionado : "Tareas"}';
          break;
        case 3:
          _textoVisualizar = '$_seleccionado : "Notificaciones"}';
          break;
      }
    });
  }
}
