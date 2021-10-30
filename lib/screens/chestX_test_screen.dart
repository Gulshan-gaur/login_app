import 'package:flutter/material.dart';
import 'package:chestX/widgets/chestX_widgets.dart';
//import 'package:'

class ChestX extends StatefulWidget {
  ChestX({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChestXScreenState createState() => _ChestXScreenState();
}

class _ChestXScreenState extends State<ChestX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('ChestX'),
        ),
      body:Padding(
        padding: EdgeInsets.all(16.0),
        child :Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          //crossAxisAlignment : crossAxisAlignment.end,
          children: <Widget>[
          /*Expanded(
            child: 
            ),
          */
          Expanded(
            child :Column(
              mainAxisAlignment : MainAxisAlignment.end,
              children:<Widget>[
                Container(
                height: 100.0,
                width: MediaQuery.of(context).size.width/3.0,
                child: nameField
                ),
               SizedBox(
                height:50.0,
                width:MediaQuery.of(context).size.width/3.0,
                child:lastnameField)
              ]
            )
           )  
          ],
        )
      )
    );
  }
}
