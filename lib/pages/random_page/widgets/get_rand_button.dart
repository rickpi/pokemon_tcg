import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_tcg/blocs/rand_pokemon/rand_pokemon_bloc.dart';
import 'package:pokemon_tcg/blocs/rand_pokemon/rand_pokemon_events.dart';
import 'package:pokemon_tcg/style/purple_button.dart';

class RandomButton extends StatelessWidget {
  const RandomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PurpleButton(
        onPressed: () {
          BlocProvider.of<RandomPokemonBloc>(context)
              .add(RandomPokemonEventGetOne());
        },
        child: Text('Get a pokémon'));
  }
}
