import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_tcg/blocs/favorites/favorites_bloc.dart';
import 'package:pokemon_tcg/blocs/favorites/favorites_states.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your favorites',
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
                color: Colors.white),
            textAlign: TextAlign.left,
          ),
          BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, state) {
              if (state is FavoritesStateUninitialized) {
                return Center(
                    child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor));
              } else if (state is FavoritesStateInitialized) {
                return GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: List.generate(
                    state.favorites.length,
                    (index) {
                      return CachedNetworkImage(
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        imageUrl: state.favorites[index].smallImage!,
                      );
                    },
                  ),
                );
              } else {
                return Text('Unknown state');
              }
            },
          ),
        ],
      ),
    );
    ;
  }
}
