import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/pokemon.dart';

abstract class PokemonRepository {
  Future<Either<Failure, Pokemon>> getPokemon(int id);

  Future<Either<Failure, bool>> capturePokemon(Pokemon pokemon);

  Future<Either<Failure, List<Pokemon>>> getCapturePokemon();
}
