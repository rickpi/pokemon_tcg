// import 'dart:convert';
import 'dart:convert';

import 'package:pokemon_tcg/constants/api.dart';
import 'package:pokemon_tcg/models/pokemon.dart';
import 'package:http/http.dart' as http;

class FavoritesRepository {
  static final instance = FavoritesRepository._singleton();
  FavoritesRepository._singleton();

  List<Pokemon>? _favorites;

  List<Pokemon>? get favorites => _favorites;

  addFav(Pokemon pokemon) async {
    if (_favorites == null) {
      await loadPokemonsFromSharedPreferences([]);
    }
    if (!this.isPokemonInList(pokemon)) {
      _favorites!.add(pokemon);
    }
  }

  removeFav(String id) async {
    if (_favorites == null) {
      await loadPokemonsFromSharedPreferences([]);
    }
    _favorites!.removeWhere((favorite) => favorite.id == id);
  }

  loadPokemonsFromSharedPreferences(List<String>? listId) async {
    if (listId == null || listId.length == 0) {
      _favorites = [];
    } else {
      _favorites = [for (var id in listId) await _getPokemonById(id)];
    }
  }

  _getPokemonById(String id) async {
    Uri uri = Uri.parse('$apiURL/$id');
    var res = await http.get(uri, headers: {'X-Api-Key': apiKey});
    var body = jsonDecode(res.body);
    return Pokemon.fromJson(body['data']);
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
