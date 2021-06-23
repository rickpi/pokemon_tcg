abstract class RandomPokemonState {}

class RandomPokemonStateUninitialized extends RandomPokemonState {}

class RandomPokemonStateInitialized extends RandomPokemonState {
  final String name;
  RandomPokemonStateInitialized(this.name);
}
