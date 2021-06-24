import 'package:pokemon_tcg/models/pokemon.dart';

abstract class SharedPreferencesEvent {}

class SharedPreferencesEventStore extends SharedPreferencesEvent {
  final List<Pokemon> pokemons;

  SharedPreferencesEventStore(this.pokemons);
}

class SharedPreferencesEventGet extends SharedPreferencesEvent {}
