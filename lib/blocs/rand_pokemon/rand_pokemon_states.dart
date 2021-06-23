abstract class RandomPokemonState {}

class RandomPokemonStateUnitialized extends RandomPokemonState {}

class RandomPokemonStateInitialized extends RandomPokemonState {
  final String name;
  RandomPokemonStateInitialized(this.name);
}
