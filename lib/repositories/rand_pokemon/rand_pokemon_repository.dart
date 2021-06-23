import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:pokemon_tcg/constants/api.dart';

class RandomPokemonRepository {
  static final instance = RandomPokemonRepository._singleton();
  final String _url = '$apiURL?q=nationalPokedexNumbers';

  RandomPokemonRepository._singleton();

  String? _name;

  String? get name => _name;

  getRandomPokemon() async {
    var rng = new Random();
    var dexNumber = rng.nextInt(890) + 1;

    Uri uri = Uri.parse('$_url:$dexNumber');
    var res = await http.get(uri, headers: {'X-Api-Key': apiKey});
    var body = jsonDecode(res.body);
    var totalCount = body['totalCount'];
    var index = rng.nextInt(totalCount);
    var data = body['data'];
    _name = data[index]['name'];
  }
}
