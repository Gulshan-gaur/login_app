import 'package:flutter/material.dart';
//import 'package:loginapp/homepage.dart';
//import 'package:splashscreen/splashscreen.dart';
import 'package:loginapp/screens/splashsscreen.dart';

void main() {
  runApp(MyApp());
}

/*
class MyApp extends StatefulWidget {
  MyApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  //This is SplashScreen
  @override
  Widget build(BuildContext context){
    return new SplashScreen(
      seconds: 14,
      navigateAfterSeconds: new MyHomePage(),
      title: new Text('X',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
      //image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
      image : new Image.asset(
          'images/loading.gif'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("ChestX"),
      loaderColor: Colors.black87
    );
  }
}
*/
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChestX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.lightGreen.shade200,
      ),
      darkTheme: ThemeData.dark(),
      home: new SplashScreenf(),
    );
  }
}