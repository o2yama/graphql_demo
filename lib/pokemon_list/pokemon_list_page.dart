import 'package:ferry/ferry.dart';
import 'package:flutter/material.dart';
import 'package:graphql_demo/graphql/all_pokemons.data.gql.dart';
import 'package:graphql_demo/graphql/all_pokemons.var.gql.dart';
import 'package:graphql_demo/graphql/client/graphql.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  @override
  Widget build(BuildContext context) {
    final _client = GraphQlClient();

    return Scaffold(
      appBar: AppBar(title: const Text('ポケモン図鑑')),
      body: StreamBuilder(
          stream: _client.listenPokemons(),
          builder: (
            context,
            AsyncSnapshot<OperationResponse<GAllPokemonData, GAllPokemonVars>?>
                snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('取得エラー'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('ノーデータ'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.data!.pokemons!.length,
                itemBuilder: (context, index) {
                  final result = snapshot.data!;
                  final pokemon = result.data!.pokemons![index];

                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      leading: Image.network(pokemon.image!),
                      title: Text(pokemon.name!),
                      subtitle: Text(pokemon.id),
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
