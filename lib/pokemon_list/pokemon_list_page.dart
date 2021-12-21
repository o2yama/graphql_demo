import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_demo/pokemon_list/pokemon_list_model.dart';

class PokemonListPage extends ConsumerWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _pokemonListModel = ref.watch(pokemonListStateProvider.notifier);
    final _pokemonList = ref.watch(pokemonListStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('ポケモン図鑑')),
      body: RefreshIndicator(
        onRefresh: () async => _pokemonListModel.listenPokemons(),
        child: ListView(
          children: _pokemonList.isNotEmpty
              ? _pokemonList
                  .map(
                    (pokemon) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: SizedBox(
                          width: 50,
                          child: Image.network(pokemon.image!),
                        ),
                        title: Text(pokemon.name!),
                        subtitle: Text(pokemon.id),
                      ),
                    ),
                  )
                  .toList()
              : const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Center(child: Text('No Pokemon...')),
                  ),
                ],
        ),
      ),
    );
  }
}
