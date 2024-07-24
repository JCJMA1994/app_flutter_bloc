import 'package:app_bloc/feature/pokemon/domain/entities/pokemon.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../repositories/pokemon_repository.dart';

class CapturePokemonUseCase {
  final PokemonRepository pokemonRepository;

  CapturePokemonUseCase({required this.pokemonRepository});

  Future<Future<Either<Failure, bool>>> call(Pokemon pokemon) async {
    return pokemonRepository.capturePokemon(pokemon);
  }
}
