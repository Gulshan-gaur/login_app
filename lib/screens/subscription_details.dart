import 'package:flutter/material.dart';
import 'package:chestX/config/graphql_client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:chestX/modules/query_mutation.dart';

final GraphQLClient client = GraphQLConfiguration().clientToQuery();

class SubscriptionScreen extends StatefulWidget {
  SubscriptionScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<SubscriptionScreen> {
  bool isLoading = false;

  void initState() {
    super.initState();
    subscriptionDetails();
  }

  subscriptionDetails() async {
    final QueryResult result = await client.query(
      QueryOptions(
          document: gql(subscriptionData), variables: {'user': 'patinets'}),
    );
    if (result.hasException) {
      print(result.exception);
    }
    if (result.isLoading != null) {
      setState(() {
        isLoading = true;
      });
      return CircularProgressIndicator();
    }
    if (result.hasException != null) {
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
