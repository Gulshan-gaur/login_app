import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
//import 'package:loginapp/homepage.dart';
import 'package:loginapp/widgets/login_screen.dart';


class SplashScreenf extends StatefulWidget {
  SplashScreenf({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenf> {

	@override
	Widget build(BuildContext context){
    return new SplashScreen(
      title: new Text('X',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.red,
        fontSize: 40.0
      ),),
      seconds: 14,
      //navigateAfterSeconds: new MyHomePage(),
      navigateAfterSeconds: new Login(),
      //image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
      image : new Image.asset(
          'images/loading.gif'),
      backgroundColor: Colors.black,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("ChestX"),
      loaderColor: Colors.red
    );
  }
}