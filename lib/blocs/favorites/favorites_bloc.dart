import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_tcg/blocs/favorites/favorites_events.dart';
import 'package:pokemon_tcg/blocs/favorites/favorites_states.dart';
import 'package:pokemon_tcg/repositories/favorites/favorites_repository.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesStateUninitialized());

  Stream<FavoritesState> mapEventToState(FavoritesEvent event) async* {
    final favoritesRepo = FavoritesRepository.instance;

    if (event is FavoritesEventAdd) {
      await favoritesRepo.addFav(event.pokemon);
    }
    if (event is FavoritesEventRemove) {
      await favoritesRepo.removeFav(event.id);
    }
    yield FavoritesStateInitialized(favoritesRepo.favorites!);
  }
}
