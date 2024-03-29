import 'package:graphql_flutter/graphql_flutter.dart';

final HttpLink _httpLink = HttpLink(uri: 'https://api.github.com/graphql');
final AuthLink _authLink = AuthLink(
  getToken: () async => 'Bearer d1121ab4f1757c72e679395ded603f2db3eb1eb2',
);
final Link _link = _authLink.concat(_httpLink);

final GraphQLClient client = GraphQLClient(cache: InMemoryCache(), link: _link);
