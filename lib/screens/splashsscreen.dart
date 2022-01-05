import 'package:flutter/material.dart';
import 'package:chestX/screens/chestX_test_screen.dart';
import 'package:chestX/screens/login_screen.dart';
import 'dart:async';
import 'package:chestX/config/secure_storage.dart';
import 'package:chestX/modules/validtoken.dart';

final SecureStorageService secureStorageService = SecureStorageService();

class SplashScreenf extends StatefulWidget {
  SplashScreenf({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenf> {
  
  @override
  /// For Spalsh Screen everytime App restart initAction() calls
  void initState() {
    super.initState();
    new Future.delayed(
      const Duration(seconds: 10),
      () =>authController());
  }

  Future<void> authController() async {
    final status = await refreshAccessExpireToken();
    //print(status);
    if (status !=null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => ChestX()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => Login()));
      
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body :new InkWell(
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  flex: 2,
                  child: new Container(
                      child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Hero(
                            tag: "splashscreenImage",
                            child: new Container(child: new Image.asset('images/loading.gif')),
                          ),
                           radius: 50
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                        ),
                      ],
                      )
                    )
                )
              ]
              )
            ]
        )
      )
      );
  }
  
}
