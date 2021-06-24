import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_tcg/blocs/favorites/favorites_bloc.dart';
import 'package:pokemon_tcg/blocs/favorites/favorites_events.dart';
import 'package:pokemon_tcg/blocs/favorites/favorites_states.dart';
import 'package:pokemon_tcg/style/scrollable_column.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your favorites',
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          Container(height: 16.0),
          Expanded(
            child: BlocBuilder<FavoritesBloc, FavoritesState>(
              builder: (context, state) {
                if (state is FavoritesStateUninitialized) {
                  BlocProvider.of<FavoritesBloc>(context)
                      .add(FavoritesEventInit());
                  return Text(
                    'You don\'t have favorite',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  );
                } else if (state is FavoritesStateEmpty) {
                  return Text(
                    'You don\'t have favorite',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  );
                } else if (state is FavoritesStateInitialized) {
                  return _listFavorites(context, state);
                } else {
                  return Text('Unknown state');
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  _listFavorites(BuildContext context, FavoritesStateInitialized state) {
    return ScrollableColumn(
        child: Column(
      children: [
        for (var fav in state.favorites)
          Card(
            color: Colors.grey.shade800,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: fav.smallImage!,
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 3,
                      child: Text(
                        fav.name!,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          BlocProvider.of<FavoritesBloc>(context)
                              .add(FavoritesEventRemove(fav.id!));
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColor,
                          size: 32.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
      ],
    ));
  }
}
