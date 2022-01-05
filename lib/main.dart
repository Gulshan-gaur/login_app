import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:chestX/config/graphql_client.dart';
import 'package:chestX/screens/splashsscreen.dart';
import 'package:chestX/screens/chestX_test_screen.dart';
import 'package:chestX/screens/login_screen.dart';
import 'package:chestX/widgets/image_pick.dart';
import 'package:chestX/widgets/drawer_class.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

void main() async {
  //Hive.init('lib');
  //debugShowCheckedModeBanner: false,
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //Hive.initFlutter();
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: graphQLConfiguration.client,
        child: CacheProvider(
            child: MaterialApp(
                title: 'ChestX',
                theme: ThemeData(
                  appBarTheme:AppBarTheme(
                   color:Colors.grey.shade700//const Color(0xFF151026),
                  ),
                  primarySwatch: Colors.lightGreen,
                  //canvasColor: Colors.lightGreen.shade200,
                ),
                //darkTheme: ThemeData.dark(),
                home: new ChestX()//Login() //SplashScreenf()
                )));
  }
}
