// import 'dart:convert';
import 'dart:convert';
import 'package:pokemon_tcg/models/pokemon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  static final instance = SharedPreferencesRepository._singleton();
  SharedPreferencesRepository._singleton();

  List<String> _stored = [];

  List<String> get stored => _stored;

  storeInSF(List<Pokemon> pokemons) async {
    List<String?> ids = [for (Pokemon pokemon in pokemons) pokemon.id];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encoded = jsonEncode(ids);
    await prefs.setString('favorites', encoded);
  }

  getFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('favorites')) {
      _stored = [];
    } else {
      String? encoded = prefs.getString('favorites');
      var decoded = jsonDecode(encoded!);

      print(decoded);
    }
  }
}
