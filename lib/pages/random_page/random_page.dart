import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_tcg/blocs/rand_pokemon/rand_pokemon_bloc.dart';
import 'package:pokemon_tcg/blocs/rand_pokemon/rand_pokemon_events.dart';
import 'package:pokemon_tcg/pages/random_page/widgets/get_rand_button.dart';
import 'package:pokemon_tcg/pages/random_page/widgets/pokemon_card.dart';

class RandomPage extends StatefulWidget {
  const RandomPage({Key? key}) : super(key: key);

  @override
  _RandomPageState createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage>
    with AfterLayoutMixin<RandomPage> {
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

  @override
  void afterFirstLayout(BuildContext context) {
    BlocProvider.of<RandomPokemonBloc>(context).add(RandomPokemonEventGetOne());
  }
}
