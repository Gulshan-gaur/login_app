import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:chestX/modules/validtoken.dart';

class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink(
    //'http://localhost:3000/dev/graphql',
    'http://127.0.0.1:5000/graphql',
  );
  static AuthLink authLink = AuthLink(
    getToken: () async { 
      //print(await getValidAccessToken());
      return 'Bearer ' + await getValidAccessToken();
    },
  );
  final Link finalLink = authLink.concat(httpLink);
  //final Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: finalLink,
    );
  }
}
/*
headers: {"authorization": "Bearer $personal_access_tokens"});
final httpLink = HttpLink(
      'https://api.github.com/graphql',
    );

    final authLink = AuthLink(
      // ignore: undefined_identifier
      getToken: () async => 'Bearer $YOUR_PERSONAL_ACCESS_TOKEN',
    );

    var link = authLink.concat(httpLink);

    if (ENABLE_WEBSOCKETS) {
      final websocketLink = WebSocketLink('ws://localhost:8080/ws/graphql');

      link = Link.split(
        (request) => request.isSubscription,
        websocketLink,
        link,
      );
    }

    final client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        cache: GraphQLCache(),
        link: link,
      ),
    );
*/
