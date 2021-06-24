import 'package:flutter/material.dart';
import 'package:pokemon_tcg/pages/favorites_page/favorites_page.dart';
import 'package:pokemon_tcg/pages/random_page/random_page.dart';

class NavigationRepository {
  static final instance = NavigationRepository._singleton();

  final List<Map<String, dynamic>> _navItems = [
    {
      'widget': RandomPage(),
      'label': 'Random',
      'icon': Icons.replay,
    },
    {
      'widget': FavoritesPage(),
      'label': 'Favorites',
      'icon': Icons.favorite,
    },
  ];
  get navItems => _navItems;

  NavigationRepository._singleton();

  int? _index;
  int? get index => _index;

  navigateTo(int index) {
    _index = index;
  }
}
