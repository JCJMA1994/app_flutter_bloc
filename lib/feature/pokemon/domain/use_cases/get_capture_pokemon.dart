import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/pokemon.dart';
import '../repositories/pokemon_repository.dart';

class GetCapturePokemonUseCase {
  final PokemonRepository pokemonRepository;

  GetCapturePokemonUseCase({required this.pokemonRepository});

  Future<Either<Failure, List<Pokemon>>> call() async {
    return pokemonRepository.getCapturePokemon();
  }
}
