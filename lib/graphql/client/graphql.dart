import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:graphql_demo/graphql/pokemons/all_pokemons.data.gql.dart';
import 'package:graphql_demo/graphql/pokemons/all_pokemons.req.gql.dart';
import 'package:graphql_demo/graphql/pokemons/all_pokemons.var.gql.dart';

class GraphQlClient {
  GraphQlClient() {
    final link = HttpLink(
      'https://graphql-pokemon2.vercel.app',
    );
    _client = Client(link: link);
  }

  late final Client _client;

  Stream<OperationResponse<GAllPokemonData, GAllPokemonVars>?>
      listenPokemons() {
    final request = GAllPokemonReq((r) => r..vars.first = 151);
    return _client.request(request);
  }
}
