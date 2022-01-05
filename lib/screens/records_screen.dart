// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:chestX/modules/query_mutation.dart';
import 'package:chestX/config/graphql_client.dart';

/// App bar + profile Button + Search bar + Drawer
/// List view Builder after query

final GraphQLClient client = GraphQLConfiguration().clientToQuery();

class RecordsScreen extends StatefulWidget {
  RecordsScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RecordsScreenState createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  bool isLoding;

  //get isLoading => null;

  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 10), () => recordQuery());
  }

  recordQuery() async {
    final QueryResult result = await client.query(
      QueryOptions(
          document: gql(recentPatients), variables: {'user': 'patinets'}),
    );
    if (result.hasException) {
      print(result.exception);
    }
    if (result.isLoading!=null) {
      setState(() {
        isLoding = true;
      });
      return CircularProgressIndicator();
    }
    if(result.data!=null) {
      print(result.data);
    }
  }

  @override
  Widget build(BuildContext context) {
    const title = 'Records';

    return /*Query(
        options: QueryOptions(
          document: gql(recentPatients),
          variables: {'user': 'patients'},
        ),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
              Container(child :isLoading?CircularProgressIndicator():null);
          /*if (result.isLoading) {
            return CircularProgressIndicator();
          }*/
          //print(result);
          //print(result.data);
          //List records = result.data['recentpatients'];
          return*/
        MaterialApp(
      title: title,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('Records'),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(100, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline5,
              ),
            );
          }),
        ),
      ),
    );
    //});
    // }
    //});
  }
}
/*Mutation(
        options: MutationOptions(
            document: gql(loginMutation),
            update: (GraphQLDataProxy cache, QueryResult result) {
              return cache;
            },
            //onCompleted: (dynamic resultData) async {
            //  print('Completed');
            //},
            onError: (dynamic resultData) async {
              if (resultData.linkException != null) {
                return Text('Internet is not working');
              } else {
                setState(() {});

                Navigator.of(context).pop();
                print(resultData.graphqlErrors[0].message);
              }
            }),
        builder: (RunMutation runMutation, QueryResult result) {
           if (result.hasException) {
                   //if (result.exception.linkException!=null){
                    //  return Text('Internet is Not Connected');
                   // }
                  print(result.exception);
                  //print(result.exception.graphqlErrors[0].message);
                }*/
/*if (result.isLoading) {
            print(Text('Loding'));
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!result.hasException) {
            if (result.data != null) {
              print(result.data);
     })*/
