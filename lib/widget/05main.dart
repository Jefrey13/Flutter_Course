import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//CupertinoPageScaffold, CupertinoTabScaffold(CupertinoTabView), CupertinoNavigationBar, etc
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Scaffold & Appbar",
      debugShowCheckedModeBanner: false,
      home: HomePage(title: "Scaffold & Appbar"),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Cursos de Programación",
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 20,
              ),
              ),
            ],
          ),
        ),
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.black38,
        leading: Icon(Icons.arrow_back_ios, color: Colors.white,
        ),
        middle: Text(
          "Titulo de la pagina.",
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
    );
  }
}

//CupertinoPageScaffold & CupertinoTabScaffold
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTabScaffold(
//         tabBar: CupertinoTabBar(
//           backgroundColor: Colors.blueAccent,
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: "Home",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.supervised_user_circle),
//               label: "Friends",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.notification_add),
//               label: "Notification",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.account_box),
//               label: "Account",
//             )
//           ],
//         ),
//         tabBuilder: (context, int index) {
//           switch (index) {
//             case 0:
//               return CupertinoTabView(builder: (context) {
//                 return CupertinoPageScaffold(
//                     child: Center(
//                   child: Column(
//                     children: [
//                       Text('$index : Inicio'),
//                     ],
//                   ),
//                 ));
//               });
//             case 1:
//               return CupertinoTabView(builder: (context) {
//                 return CupertinoPageScaffold(
//                     child: Center(
//                   child: Column(
//                     children: [
//                       Text('$index : Friends'),
//                     ],
//                   ),
//                 ));
//               });
//             case 2:
//               return CupertinoTabView(builder: (context) {
//                 return CupertinoPageScaffold(
//                     child: Center(
//                   child: Column(
//                     children: [
//                       Text('$index : Notification'),
//                     ],
//                   ),
//                 ));
//               });
//             case 3:
//               return CupertinoTabView(builder: (context) {
//                 return CupertinoPageScaffold(
//                     child: Center(
//                   child: Column(
//                     children: [
//                       Text('$index : Account'),
//                     ],
//                   ),
//                 ));
//               });
//             default:
//               return CupertinoTabView(builder: (context) {
//                 return CupertinoPageScaffold(
//                     child: Center(
//                   child: Column(
//                     children: [Text('$index : Home')],
//                   ),
//                 ));
//               });
//           }
//         });
//   }
// //   return const CupertinoPageScaffold(
// //       child: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text("Cupertino"),
// //           ],
// //         ),
// //       )
// //   );
// //
// // }
// }
