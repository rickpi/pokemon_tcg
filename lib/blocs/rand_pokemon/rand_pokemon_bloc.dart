import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_tcg/blocs/rand_pokemon/rand_pokemon_events.dart';
import 'package:pokemon_tcg/blocs/rand_pokemon/rand_pokemon_states.dart';
import 'package:pokemon_tcg/repositories/rand_pokemon/rand_pokemon_repository.dart';

class RandomPokemonBloc extends Bloc<RandomPokemonEvent, RandomPokemonState> {
  RandomPokemonBloc() : super(RandomPokemonStateUninitialized());

  Stream<RandomPokemonState> mapEventToState(RandomPokemonEvent event) async* {
    final randPokeRepo = RandomPokemonRepository.instance;

    if (event is RandomPokemonEventGetOne) {
      await randPokeRepo.getRandomPokemon();
      yield RandomPokemonStateInitialized(randPokeRepo.pokemon!);
    }
    if (event is RandomPokemonEventLoading) {
      yield RandomPokemonStateIsLoading();
    }
  }
}
