import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
//import 'package:loginapp/homepage.dart';
import 'package:chestX/screens/login_screen.dart';


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
      seconds: 10,
      //navigateAfterSeconds: new MyHomePage(),
      navigateAfterSeconds: new Login(),
      image : new Image.asset(
          'images/loading.gif'),
      backgroundColor: Colors.black,
      //styleTextUnderTheLoader: new TextStyle(),
      photoSize: 50.0,
      loaderColor: Colors.black87
    );
  }
}