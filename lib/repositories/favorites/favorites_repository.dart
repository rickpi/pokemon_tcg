// import 'dart:convert';
import 'package:pokemon_tcg/models/pokemon.dart';

class FavoritesRepository {
  static final instance = FavoritesRepository._singleton();

  FavoritesRepository._singleton();

  List<Pokemon>? _favorites;

  List<Pokemon>? get favorites => _favorites;

  addFav(Pokemon pokemon) {
    if (_favorites == null) {
      _loadPokemonsFromSharedPreferences();
    }
    if (!this.isPokemonInList(pokemon)) {
      _favorites!.add(pokemon);
    }
  }

  removeFav(String id) {
    if (_favorites == null) {
      _loadPokemonsFromSharedPreferences();
    }
    _favorites!.removeWhere((favorite) => favorite.id == id);
  }

  _loadPokemonsFromSharedPreferences() {
    _favorites = [];
  }

  bool isPokemonInList(Pokemon pokemon) {
    try {
      this._favorites!.firstWhere((item) => item.id == pokemon.id);
      return true;
    } catch (_) {
      return false;
    }
  }
}
