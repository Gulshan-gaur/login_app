import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:chestX/config/graphl_client.dart';
import 'package:chestX/screens/splashsscreen.dart';
import 'package:chestX/screens/chestX_test_screen.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: graphQLConfiguration.client,
        child: MaterialApp(
          title: 'ChestX',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            //canvasColor: Colors.lightGreen.shade200,
          ),
          darkTheme: ThemeData.dark(),
          home: new SplashScreenf()//ChestX(),
        ));
  }
}
