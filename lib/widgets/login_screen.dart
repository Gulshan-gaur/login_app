import 'package:flutter/material.dart';
import 'package:loginapp/homepage.dart';

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
      borderRadius: BorderRadius.circular(30.0),
      //color: Color(0xff01A0C7),
      color : Colors.black87,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage())),
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        //backgroundColor: Colors.black87,
        body : Padding(
        padding:
            EdgeInsets.zero,//only(top: 60.0, bottom: 60.0, left: 120.0, right: 120.0),
            child: Row(
              children: <Widget>[
                    Expanded(
                      child:Container(
                      height:  MediaQuery.of(context).size.height,
                      //width: MediaQuery.of(context).size.width/2,
                      color:Colors.black87,
                      child:Image(image:AssetImage('images/login.gif'))
                      /*
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/login.gif'),
                          fit: BoxFit.fill,
                      ),
                  //shape: BoxShape.circle,
                  ),*/
                  )
                  ),
                   Padding(
                    padding: EdgeInsets.all(16.0),
                  ),  
                  //Text('Row Nesting 2'),
                  Expanded(
                      child : Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children:<Widget>[
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
                  SizedBox(height: 55.0),
                  emailField,
                  SizedBox(height: 20.0),
                  passwordField,
                  SizedBox(height: 30.0),
                  loginButon,
                  SizedBox(height: 15.0)
                  ]
                  )
                  ),       
                  Padding(
                    padding: EdgeInsets.all(16.0),
                  )
                 // SizedBox(height: 45.0),
                  //emailField,
                  //SizedBox(height: 25.0),
                  //passwordField,
                  //SizedBox(height: 35.0),
                  //loginButon,
                  //SizedBox(height: 15.0)
                ]
                    //child: Image.asset('images/login.gif')
                )
             
            )
    );
  }
}
/*
SizedBox(height: 45.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Expanded(child: Center(child: TextButton(...))),
    VerticalDivider(width: 1.0),                      
*/
