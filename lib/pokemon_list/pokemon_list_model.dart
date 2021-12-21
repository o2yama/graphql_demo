import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_demo/graphql/all_pokemons.data.gql.dart';
import 'package:graphql_demo/graphql/client/graphql.dart';

final pokemonListStateProvider =
    StateNotifierProvider<PokemonListState, List<GAllPokemonData_pokemons>>(
  (ref) => PokemonListState()..listenPokemons(),
);

class PokemonListState extends StateNotifier<List<GAllPokemonData_pokemons>> {
  PokemonListState() : super(<GAllPokemonData_pokemons>[]);

  final _client = GraphQlClient();

  void listenPokemons() {
    _client.listenPokemons().listen((event) {
      if (event != null) {
        if (event.data != null) {
          if (event.data!.pokemons != null) {
            state = event.data!.pokemons!.toList();
          }
        }
      }
    });
  }
}
