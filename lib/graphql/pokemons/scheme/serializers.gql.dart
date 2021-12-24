import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;
import 'package:graphql_demo/graphql/pokemons/all_pokemons.data.gql.dart'
    show GAllPokemonData, GAllPokemonData_pokemons;
import 'package:graphql_demo/graphql/pokemons/all_pokemons.req.gql.dart'
    show GAllPokemonReq;
import 'package:graphql_demo/graphql/pokemons/all_pokemons.var.gql.dart'
    show GAllPokemonVars;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GAllPokemonData,
  GAllPokemonData_pokemons,
  GAllPokemonReq,
  GAllPokemonVars
])
final Serializers serializers = _serializersBuilder.build();
