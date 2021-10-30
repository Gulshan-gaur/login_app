import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:chestX/config/secure_storage.dart';

SecureStorageService secureStorageService = SecureStorageService();

class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink(
    'http://localhost:3000/dev/graphql',
  );

  static AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer $secureStorageService.getAccessToken()',
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: httpLink,
    );
  }
}
