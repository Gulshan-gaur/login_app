import 'package:flutter/material.dart';

final userIdController = TextEditingController();
final passwordController = TextEditingController();

TextStyle style = TextStyle(fontSize: 16.0, color: Colors.white);

final emailField = TextField(
  controller:userIdController,
  keyboardType: TextInputType.text,
  textAlign: TextAlign.left,
  obscureText: false,
  style: style,
  decoration: InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 5.0),
    hintText:  "User ID",
    //labelText: "User ID",
    labelStyle: TextStyle(color: Colors.purple),
    //enabledBorder
    /*validator: (v) {
      if (v.length == 0) {
        return "Rocket name cannot be empty";
      } else {
        return null;
      }
    },*/
   //border:OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),
     // borderSide: BorderSide(color: Colors.green,style: BorderStyle.solid)),
    enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(color: Colors.white70,style: BorderStyle.solid)),  
  ),
);

final passwordField = TextField(
  controller:passwordController,
  keyboardType: TextInputType.text,
  textAlign: TextAlign.left,
  obscureText: true,
  style: style,
  decoration: InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    hintText : "Password",
    //labelText: "Password",
    //labelStyle: TextStyle(color: Colors.purple),
    enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),
     borderSide: BorderSide(color: Colors.white70,style: BorderStyle.solid))),
);

