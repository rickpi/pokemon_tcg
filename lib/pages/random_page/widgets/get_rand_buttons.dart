import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_tcg/blocs/rand_pokemon/rand_pokemon_bloc.dart';
import 'package:pokemon_tcg/blocs/rand_pokemon/rand_pokemon_events.dart';
import 'package:pokemon_tcg/style/purple_button.dart';

class RandomButton extends StatelessWidget {
  const RandomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PurpleButton(
          onPressed: () {
            BlocProvider.of<RandomPokemonBloc>(context)
                .add(RandomPokemonEventLoading());
            BlocProvider.of<RandomPokemonBloc>(context)
                .add(RandomPokemonEventGetOne());
          },
          child: Text('Get a pokémon'),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite,
                color: Theme.of(context).primaryColor, size: 32.0))
      ],
    );
  }
}
