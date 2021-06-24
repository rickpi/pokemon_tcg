import 'package:pokemon_tcg/models/pokemon.dart';

abstract class FavoritesState {}

class FavoritesStateUninitialized extends FavoritesState {}

class FavoritesStateInitialized extends FavoritesState {
  final List<Pokemon> favorites;
  FavoritesStateInitialized(this.favorites);
}

class FavoritesStateEmpty extends FavoritesState {
  final List<Pokemon> favorites = [];
  FavoritesStateEmpty();
}
