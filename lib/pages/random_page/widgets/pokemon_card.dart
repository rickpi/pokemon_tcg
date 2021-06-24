import 'package:after_layout/after_layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_tcg/blocs/favorites/favorites_bloc.dart';
import 'package:pokemon_tcg/blocs/favorites/favorites_events.dart';
import 'package:pokemon_tcg/blocs/rand_pokemon/rand_pokemon_bloc.dart';
import 'package:pokemon_tcg/blocs/rand_pokemon/rand_pokemon_events.dart';
import 'package:pokemon_tcg/blocs/rand_pokemon/rand_pokemon_states.dart';
import 'package:pokemon_tcg/repositories/favorites/favorites_repository.dart';

class PokemonCard extends StatefulWidget {
  const PokemonCard({Key? key}) : super(key: key);

  @override
  _PokemonCardState createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard>
    with AfterLayoutMixin<PokemonCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomPokemonBloc, RandomPokemonState>(
      builder: (context, state) {
        if (state is RandomPokemonStateUninitialized ||
            state is RandomPokemonStateIsLoading) {
          return Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor));
        } else if (state is RandomPokemonStateInitialized) {
          return _card(state);
        } else {
          return Text('State unknown');
        }
      },
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    BlocProvider.of<RandomPokemonBloc>(context).add(RandomPokemonEventGetOne());
  }

  Widget _card(RandomPokemonStateInitialized state) {
    return InkWell(
      onDoubleTap: () => {
        if (FavoritesRepository.instance.isPokemonInList(state.pokemon))
          {
            BlocProvider.of<FavoritesBloc>(context)
                .add(FavoritesEventRemove(state.pokemon.id!))
          }
        else
          {
            BlocProvider.of<FavoritesBloc>(context)
                .add(FavoritesEventAdd(state.pokemon))
          }
      },
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        imageUrl: state.pokemon.smallImage!,
      ),
    );
  }
}
