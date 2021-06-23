import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_tcg/blocs/rand_pokemon/rand_pokemon_bloc.dart';
import 'package:pokemon_tcg/blocs/rand_pokemon/rand_pokemon_states.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomPokemonBloc, RandomPokemonState>(
      builder: (context, state) {
        if (state is RandomPokemonStateUninitialized ||
            state is RandomPokemonStateIsLoading) {
          return CircularProgressIndicator();
        } else if (state is RandomPokemonStateInitialized) {
          return Text(state.pokemon.name!);
        } else {
          return Text('State unknown');
        }
      },
    );
  }
}
