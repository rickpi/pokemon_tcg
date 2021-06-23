import 'dart:convert';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_tcg/models/pokemon.dart';
import 'package:pokemon_tcg/pages/old_project/pokemon_card.dart';

class Overview extends StatefulWidget {
  final String url = 'https://api.pokemontcg.io/v2/cards';
  final String apiKey = '0d2767d6-14d0-4aa3-b576-b617cac93f27';

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> with AfterLayoutMixin<Overview> {
  List<Pokemon> _pokemons = [];
  //List<String> _q = [];
  String _pageSize = '30';

  @override
  Widget build(BuildContext context) {
    return Expanded(child: _contentDependingInState());
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // Calling the same function "after layout" to resolve the issue.
    _getAllCards();
  }

  Widget _contentDependingInState() {
    if (_pokemons.length == 0) {
      return Center(child: CircularProgressIndicator());
    } else {
      return _renderCards();
    }
  }

  _getAll() async {
    String url = widget.url;
    url = '$url?pageSize=$_pageSize';
    Uri uri = Uri.parse(url);

    return await http.get(uri, headers: {'X-Api-Key': widget.apiKey});
  }

  _getAllCards() async {
    var url = Uri.parse(widget.url);
    var res = await _getAll();
    var body = jsonDecode(res.body);

    var pokemons = [for (var el in body['data']) Pokemon.fromJson(el)];

    setState(() {
      _pokemons = pokemons;
    });
  }

  Widget _renderCards() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      children: List.generate(
          _pokemons.length, (index) => PokemonCard(pokemon: _pokemons[index])),
    );
  }
}
