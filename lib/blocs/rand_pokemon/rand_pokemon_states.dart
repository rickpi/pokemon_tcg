import 'package:pokemon_tcg/models/pokemon.dart';

abstract class RandomPokemonState {}

class RandomPokemonStateUninitialized extends RandomPokemonState {}

class RandomPokemonStateIsLoading extends RandomPokemonState {}

class RandomPokemonStateInitialized extends RandomPokemonState {
  final Pokemon pokemon;
  RandomPokemonStateInitialized(this.pokemon);
}
