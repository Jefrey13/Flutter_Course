import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Icons
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Icons",
      debugShowCheckedModeBanner: false,
      home: HomePage(title: "Icons"),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text(widget.title!)),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Material Icon",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
                ),
                Padding(padding: EdgeInsets.all(10),),
                Icon(
                    Icons.home,
                  color: Colors.blueAccent,
                    size: 30,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Cupertino Icon",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Padding(padding: EdgeInsets.all(10),),
                Icon(
                  CupertinoIcons.home,
                  color: Colors.blueAccent,
                  size: 30,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Font Awesome Icon",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Padding(padding: EdgeInsets.all(10),),
                FaIcon(
                  FontAwesomeIcons.house,
                  color: Colors.redAccent,
                  size: 30,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
