// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:graphql_demo/graphql/pokemons/all_pokemons.ast.gql.dart' as _i5;
import 'package:graphql_demo/graphql/pokemons/all_pokemons.data.gql.dart'
    as _i2;
import 'package:graphql_demo/graphql/pokemons/all_pokemons.var.gql.dart' as _i3;
import 'package:graphql_demo/graphql/pokemons/scheme/serializers.gql.dart'
    as _i6;

part 'all_pokemons.req.gql.g.dart';

abstract class GAllPokemonReq
    implements
        Built<GAllPokemonReq, GAllPokemonReqBuilder>,
        _i1.OperationRequest<_i2.GAllPokemonData, _i3.GAllPokemonVars> {
  GAllPokemonReq._();

  factory GAllPokemonReq([Function(GAllPokemonReqBuilder b) updates]) =
      _$GAllPokemonReq;

  static void _initializeBuilder(GAllPokemonReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'AllPokemon')
    ..executeOnListen = true;
  _i3.GAllPokemonVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GAllPokemonData? Function(_i2.GAllPokemonData?, _i2.GAllPokemonData?)?
      get updateResult;
  _i2.GAllPokemonData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GAllPokemonData? parseData(Map<String, dynamic> json) =>
      _i2.GAllPokemonData.fromJson(json);
  static Serializer<GAllPokemonReq> get serializer =>
      _$gAllPokemonReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GAllPokemonReq.serializer, this)
          as Map<String, dynamic>);
  static GAllPokemonReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GAllPokemonReq.serializer, json);
}
