import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class RandomPokemonRepository {
  static final instance = RandomPokemonRepository._singleton();
  final String _apiKey = '0d2767d6-14d0-4aa3-b576-b617cac93f27';
  final String _url =
      'https://api.pokemontcg.io/v2/cards?q=nationalPokedexNumbers';

  RandomPokemonRepository._singleton();

  String? _name;

  getRandomPokemon() async {
    var rng = new Random();
    var dexNumber = rng.nextInt(890) + 1;

    Uri uri = Uri.parse('$_url:$dexNumber');
    var res = await http.get(uri, headers: {'X-Api-Key': _apiKey});
    var body = jsonDecode(res.body);
    var totalCount = body['totalCount'];
    var index = rng.nextInt(totalCount);
    var data = body['data'];
    _name = data[index]['name'];
  }
}
