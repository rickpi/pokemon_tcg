abstract class RandomPokemonState {}

class RandomPokemonStateUninitialized extends RandomPokemonState {}

class RandomPokemonStateIsLoading extends RandomPokemonState {}

class RandomPokemonStateInitialized extends RandomPokemonState {
  final String name;
  RandomPokemonStateInitialized(this.name);
}
