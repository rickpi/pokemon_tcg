import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_tcg/blocs/shared_preferences/shared_preferences_events.dart';
import 'package:pokemon_tcg/blocs/shared_preferences/shared_preferences_states.dart';
import 'package:pokemon_tcg/repositories/shared_preferences/shared_preferences_repository.dart';

class SharedPreferencesBloc
    extends Bloc<SharedPreferencesEvent, SharedPreferencesState> {
  SharedPreferencesBloc() : super(SharedPreferencesStateUninitialized());

  Stream<SharedPreferencesState> mapEventToState(
      SharedPreferencesEvent event) async* {
    final sfRepo = SharedPreferencesRepository.instance;

    if (event is SharedPreferencesEventStore) {
      await sfRepo.storeInSF(event.pokemons);
      yield SharedPreferencesStateInitialized();
    }

    if (event is SharedPreferencesEventGet) {
      await sfRepo.getFromSF();
      yield SharedPreferencesStateInitialized();
    }
  }
}
