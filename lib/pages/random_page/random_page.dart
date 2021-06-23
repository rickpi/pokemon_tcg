import 'package:flutter/material.dart';
import 'package:pokemon_tcg/pages/random_page/widgets/get_rand_button.dart';
import 'package:pokemon_tcg/pages/random_page/widgets/pokemon_card.dart';
import 'package:pokemon_tcg/style/purple_button.dart';

class RandomPage extends StatelessWidget {
  const RandomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Pokémon TCG Manager')),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PokemonCard(),
                Container(height: 20.0),
                RandomButton()
              ],
            ),
          ],
        ));
  }
}
