import 'package:app_bloc/core/error/failure.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../models/pokemon_model.dart';

abstract class PokemonRemote {
  Future<Either<Failure, PokemonModel>> getPokemon(int id);
}

class PokemonRemoteImpl implements PokemonRemote {
  final Dio dio = Dio();

  @override
  Future<Either<Failure, PokemonModel>> getPokemon(int id) async {
    final response = await dio.get('https://pokeapi.co/api/v2/pokemon/$id/');
    if (response.statusCode == 200) {
      final pokemon = PokemonModel.fromJson(response.data);
      return Right(pokemon);
    } else {
      return Left(ServerFailure());
    }
  }
}
