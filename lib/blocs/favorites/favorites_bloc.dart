import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_tcg/blocs/favorites/favorites_events.dart';
import 'package:pokemon_tcg/blocs/favorites/favorites_states.dart';
import 'package:pokemon_tcg/repositories/favorites/favorites_repository.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesStateUninitialized());

  Stream<FavoritesState> mapEventToState(FavoritesEvent event) async* {
    final favoritesRepo = FavoritesRepository.instance;

    if (event is FavoritesEventInit) {
      favoritesRepo.loadPokemonsFromSharedPreferences();
      yield FavoritesStateEmpty();
    }
    if (event is FavoritesEventAdd) {
      favoritesRepo.addFav(event.pokemon);
      yield FavoritesStateInitialized(favoritesRepo.favorites!);
    }
    if (event is FavoritesEventRemove) {
      favoritesRepo.removeFav(event.id);
      if (favoritesRepo.favorites!.length == 0) {
        yield FavoritesStateEmpty();
      } else {
        yield FavoritesStateInitialized(favoritesRepo.favorites!);
      }
    }
  }
}
