import 'package:flutter/material.dart';

final fnameController = TextEditingController();
final lnameController = TextEditingController();
final genController =   TextEditingController();
final ageController = TextEditingController();
final posController = TextEditingController();

TextStyle style = TextStyle(fontSize: 16.0, color: Colors.grey.shade800);

final nameField = TextField(
  controller: fnameController,
  keyboardType: TextInputType.text,
  textAlign: TextAlign.left,
  obscureText: false,
  style: style,
  decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      fillColor: Colors.blue,
      labelText: "First Name",
      labelStyle: TextStyle(color: Colors.purple),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),
      borderSide: BorderSide(style: BorderStyle.solid))),
);

final lastnameField = TextField(
  controller: lnameController,
  keyboardType: TextInputType.text,
  textAlign: TextAlign.left,
  obscureText: false,
  style: style,
  decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      labelText: "Last Name",
      labelStyle: TextStyle(color: Colors.purple),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
);

final genderField = TextField(
  controller: genController,
  keyboardType: TextInputType.text,
  textAlign: TextAlign.left,
  obscureText: true,
  style: style,
  decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      labelText: "Gender",
      labelStyle: TextStyle(color: Colors.purple),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
);

final ageField = TextField(
  controller: ageController,
  keyboardType: TextInputType.text,
  textAlign: TextAlign.left,
  obscureText: false,
  style: style,
  decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      labelText: "Age",
      labelStyle: TextStyle(color: Colors.purple),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
);

final positionField = TextField(
  controller: posController,
  keyboardType: TextInputType.text,
  textAlign: TextAlign.left,
  obscureText: false,
  style: style,
  decoration: InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      labelText: "PA/AP",
      labelStyle: TextStyle(color: Colors.purple),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
);
