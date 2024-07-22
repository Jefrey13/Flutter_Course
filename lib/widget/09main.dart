import 'package:flutter/material.dart';

//Imagenes

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
      body: Column(
        children: [
          Image.asset("assets/img/banderanica.png",
          width: 50,
          height: 50,
            fit: BoxFit.cover,
          ),
          Image.asset("assets/img/banderanica.png",
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          Image.network('https://jadecorazon.org/wp-content/uploads/2022/04/Bandera-Panama.jpg',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            alignment: Alignment.center,
            repeat: ImageRepeat.noRepeat,
          ),
          FadeInImage.assetNetwork(
              placeholder: 'https://static.vecteezy.com/system/resources/thumbnails/008/202/381/small_2x/loading-circle-icon-loading-gif-loading-screen-gif-loading-spinner-gif-loading-animation-loading-free-video.jpg',
              image: 'https://jadecorazon.org/wp-content/uploads/2022/04/Bandera-Panama.jpg',
          height: 50, width: 50, alignment: Alignment.center,
          )
        ],
      ),
    );
  }
}
