import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_tcg/blocs/favorites/favorites_bloc.dart';
import 'package:pokemon_tcg/blocs/favorites/favorites_events.dart';
import 'package:pokemon_tcg/blocs/favorites/favorites_states.dart';
import 'package:pokemon_tcg/blocs/rand_pokemon/rand_pokemon_bloc.dart';
import 'package:pokemon_tcg/blocs/rand_pokemon/rand_pokemon_events.dart';
import 'package:pokemon_tcg/blocs/rand_pokemon/rand_pokemon_states.dart';
import 'package:pokemon_tcg/blocs/shared_preferences/shared_preferences_bloc.dart';
import 'package:pokemon_tcg/blocs/shared_preferences/shared_preferences_events.dart';
import 'package:pokemon_tcg/models/pokemon.dart';
import 'package:pokemon_tcg/repositories/favorites/favorites_repository.dart';
import 'package:pokemon_tcg/repositories/shared_preferences/shared_preferences_repository.dart';
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
        BlocBuilder<RandomPokemonBloc, RandomPokemonState>(
          builder: (context, state) {
            if (state is RandomPokemonStateUninitialized ||
                state is RandomPokemonStateIsLoading) {
              return Icon(Icons.favorite_border_outlined,
                  color: Theme.of(context).primaryColor, size: 32.0);
            } else if (state is RandomPokemonStateInitialized) {
              return _favButton(context, state.pokemon);
            } else {
              return Text('State unknown');
            }
          },
        ),
      ],
    );
  }

  Widget _favButton(BuildContext context, Pokemon pokemon) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesStateUninitialized) {
          BlocProvider.of<FavoritesBloc>(context).add(
              FavoritesEventInit(SharedPreferencesRepository.instance.stored));
          return _addButton(context, pokemon);
        } else if (state is FavoritesStateInitialized ||
            state is FavoritesStateEmpty) {
          BlocProvider.of<SharedPreferencesBloc>(context).add(
              SharedPreferencesEventStore(
                  FavoritesRepository.instance.favorites!));
          return FavoritesRepository.instance.isPokemonInList(pokemon)
              ? _removeButton(context, pokemon)
              : _addButton(context, pokemon);
        } else {
          return Text('State unknown');
        }
      },
    );
  }

  Widget _addButton(BuildContext context, Pokemon pokemon) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<FavoritesBloc>(context).add(FavoritesEventAdd(pokemon));
      },
      icon: Icon(
        Icons.favorite_border_outlined,
        color: Theme.of(context).primaryColor,
        size: 32.0,
      ),
    );
  }

  Widget _removeButton(BuildContext context, Pokemon pokemon) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<FavoritesBloc>(context)
            .add(FavoritesEventRemove(pokemon.id!));
      },
      icon: Icon(
        Icons.favorite,
        color: Theme.of(context).primaryColor,
        size: 32.0,
      ),
    );
  }
}
