import 'package:pokemon_tcg/models/pokemon.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesState {}

class SharedPreferencesStateUninitialized extends SharedPreferencesState {}

class SharedPreferencesStateInitialized extends SharedPreferencesState {}
