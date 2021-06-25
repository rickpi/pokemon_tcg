import 'package:pokemon_tcg/models/pokemon.dart';

abstract class FavoritesEvent {}

class FavoritesEventAdd extends FavoritesEvent {
  final Pokemon pokemon;

  FavoritesEventAdd(this.pokemon);
}

class FavoritesEventRemove extends FavoritesEvent {
  final String id;

  FavoritesEventRemove(this.id);
}

class FavoritesEventInit extends FavoritesEvent {
  final List<String>? listId;

  FavoritesEventInit(this.listId);
}
