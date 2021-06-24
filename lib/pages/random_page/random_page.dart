import 'package:flutter/material.dart';
import 'package:pokemon_tcg/pages/random_page/widgets/get_rand_buttons.dart';
import 'package:pokemon_tcg/pages/random_page/widgets/pokemon_card.dart';

class RandomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(title: Text('Pokémon TCG Manager')),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Get a random Pokémon',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                textAlign: TextAlign.left,
              ),
              Container(height: 30.0),
              Expanded(flex: 3, child: PokemonCard()),
              Container(height: 20.0),
              RandomButton()
            ],
          ),
        ));
  }
}
