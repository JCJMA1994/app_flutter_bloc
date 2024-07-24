import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/pokemon.dart';
import '../repositories/pokemon_repository.dart';

class GetPokemonUseCase {
  final PokemonRepository pokemonRepository;

  GetPokemonUseCase({required this.pokemonRepository});

  Future<Either<Failure, Pokemon>> call(int id) async {
    return pokemonRepository.getPokemon(id);
  }
}
