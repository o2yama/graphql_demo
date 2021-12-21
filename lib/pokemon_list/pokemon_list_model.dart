import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_demo/graphql/client/graphql.dart';

final pokemonListModelProvider = StateNotifierProvider<PokemonListModel, List>(
  (ref) => PokemonListModel(),
);

class PokemonListModel extends StateNotifier<List> {
  PokemonListModel() : super([]);

  final _client = GraphQlClient();

  void getAllPokemons() {
    _client.listenPokemons();
  }
}
