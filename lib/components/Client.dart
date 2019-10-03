import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink _httpLink = HttpLink(uri: 'https://api.github.com/graphql');
final AuthLink _authLink = AuthLink(
  getToken: () async => 'Bearer 6d1756e83ad65e23701d606eca332c1baf5953f3',
);
final Link _link = _authLink.concat(_httpLink);

final GraphQLClient client = GraphQLClient(cache: InMemoryCache(), link: _link);
