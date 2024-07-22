import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Texts
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text(widget.title!)),
      ),
        body: const Center(
          child: SelectableText(
            'This is a selectable text. You can copy me!',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
        // body: Center(
        //   child: RichText(
        //     text: const TextSpan(
        //       text: 'Hello, ',
        //       style: TextStyle(fontSize: 24, color: Colors.black),
        //       children: <TextSpan>[
        //         TextSpan(
        //           text: 'Flutter',
        //           style: TextStyle(
        //               fontWeight: FontWeight.bold, color: Colors.blue),
        //         ),
        //         TextSpan(
        //           text: ' developers!',
        //           style: TextStyle(fontStyle: FontStyle.italic, color: Colors.red),
        //         ),
        //       ],
        //     ),
        //   ),
        // )

        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     Text("Text",
        //     style: TextStyle(
        //       fontSize: 20,
        //       fontWeight: FontWeight.normal,
        //       color: Colors.redAccent,
        //       letterSpacing: 2.0,
        //       wordSpacing: 3.0,
        //       shadows: [
        //         Shadow(
        //           blurRadius: 10.0,
        //           color: Colors.amberAccent,
        //           offset: Offset(1, 1),
        //         )
        //       ]
        //     ),
        //       textAlign: TextAlign.center,
        //       maxLines: 3,
        //       overflow: TextOverflow.ellipsis,
        //     )
        //   ],
        // ),

      );
  }
}
