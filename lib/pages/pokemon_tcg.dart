import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_tcg/pages/overview.dart';

class PokemonTCG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text('Pokémon TCG App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Overview(),
          ],
        ),
      ),
    ));
  }
}
