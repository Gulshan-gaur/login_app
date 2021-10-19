import 'package:flutter/material.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Widget Tree'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(children: <Widget>[
            Row(children: <Widget>[
              Container(
                color: Colors.green,
                height: 40.0,
                width: 40.0,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
              ),
              Expanded(
                  child: Container(
                    color: Colors.red,
                    height: 40.0,
                    width: 40.0,
              )),
              Padding(padding: EdgeInsets.all(16.0),),
              Container(
                color:Colors.blueAccent,
                height:40.0,
                width:40.0
              )
            ]
            ),
	          Padding(padding: EdgeInsets.all(16.0),),
            Row(
              children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        color: Colors.red,
                        height: 20.0,
                        width: 20.0,
                      ),
                      Padding(padding: EdgeInsets.all(16.0),),
                      Container(
                        color: Colors.green,
                        height: 20.0,
                        width: 20.0,
                      ),

                  ]
                  ),
                  Divider(),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.indigo,
                        radius: 100.0,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 100.0,
                              width: 100.0,
                              color: Colors.lightGreen,
                            ),
                            Container(
                              height: 60.0,
                              width: 60.0,
                              color: Colors.amber,
                            ),
                            Container(
                              height: 40.0,
                              width: 40.0,
                              color: Colors.brown,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ]
            )
          ]
          )
          ),
        )
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>print("Aalu"),
        tooltip: 'Add',
        child: Icon(Icons.add),
      )
    );
  }
}
/*
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        titleTextStyle:Theme.of(context).textTheme.headline6,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
