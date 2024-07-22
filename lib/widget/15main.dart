import 'package:flutter/material.dart';
import 'package:fluttercourse/widget/15.1ControladorContador.dart';


//Bloc: Separacion de parte logica y la visual(
// Es una tecnic apara solicionar este problema a traves de los Strim)
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Bloc",
      debugShowCheckedModeBanner: false,
      home: HomePage(title: "Bloc"),
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
  ControlContador _controlContador = ControlContador();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _controlContador.stream,
      initialData: 0,
      builder: (context, snapshot){
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title!),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Stream"),
                Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _controlContador.increment,
            backgroundColor: Colors.blueAccent,
            tooltip: "increment",
              child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
  @override
  void dispose(){
    _controlContador.dispose();
    super.dispose();
  }
}
