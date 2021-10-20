import 'package:flutter/material.dart';
import 'package:chestX/homepage.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login> {
  TextStyle style = TextStyle(fontSize: 16.0,color: Colors.grey.shade800);
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      keyboardType: TextInputType.text,
      textAlign: TextAlign.left,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "User ID",
          labelStyle: TextStyle(color: Colors.purple),
          border:OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
    );

    final passwordField = TextField(
      keyboardType: TextInputType.text,
      textAlign: TextAlign.left,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "Password",
          labelStyle: TextStyle(color: Colors.purple),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20.0),
      //color: Color(0xff01A0C7),
      color : Colors.black87,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width/10.0,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage())),
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body : Padding(
        padding:
            EdgeInsets.zero,
            child: Row(
              children: <Widget>[
                    Expanded(
                      child:Container(
                      height:  MediaQuery.of(context).size.height,
                      color:Colors.black87,
                      child:Image(image:AssetImage('images/login.gif'))
                  )
                  ),
                   Padding(
                    padding: EdgeInsets.all(16.0),
                  ),
                  Expanded(
                      child : Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children:<Widget>[
                           Container(
                            height:60.0,
                            width:60.0,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text('ChestX')
                              /*FlutterLogo(
                               size: 100,
                              ),*/
                            ),
                            ),
                           //Text('ChestX'),
                           SizedBox(height: 65.0),
                           SizedBox(
                            height: 65.0,
                            width:MediaQuery.of(context).size.width/3.0,
                           child:emailField),
                           //SizedBox(height: 10.0),
                           SizedBox(
                            height: 65.0,
                            width:MediaQuery.of(context).size.width/3.0,
                           child:passwordField),
                           SizedBox(height: 4.0),
                           loginButon,
                           SizedBox(height: 15.0),
                           Text(
                            '@Powered By Friday',
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10.0
                            )
                            )
                  ]
                  )
                  ),       
                  Padding(
                    padding: EdgeInsets.all(16.0),
                  )
                ]
                )
             
            )
    );
  }
}
/*
                           TextField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 16.0,
                        ),
                        decoration: InputDecoration(
                        labelText: "User ID",
                        labelStyle: TextStyle(color: Colors.purple),
                         //border: UnderlineInputBorder(),
                        border: OutlineInputBorder(),
                       )
                    ),
                  */

