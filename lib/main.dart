import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_tcg/blocs/navigation/navigation_bloc.dart';
import 'package:pokemon_tcg/blocs/rand_pokemon/rand_pokemon_bloc.dart';
import 'package:pokemon_tcg/routes/routes.dart';
import 'package:pokemon_tcg/style/themes.dart';

import 'blocs/favorites/favorites_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RandomPokemonBloc>(
          create: (_) => RandomPokemonBloc(),
        ),
        BlocProvider<FavoritesBloc>(
          create: (_) => FavoritesBloc(),
        ),
        BlocProvider<NavigationBloc>(
          create: (_) => NavigationBloc(),
        ),
      ],
      child: MaterialApp(
        theme: appTheme,
        initialRoute: '/',
        routes: appRoutes,
      ),
    );
  }
}
