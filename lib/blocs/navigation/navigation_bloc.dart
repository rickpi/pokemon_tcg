import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_tcg/blocs/navigation/navigation_events.dart';
import 'package:pokemon_tcg/blocs/navigation/navigation_states.dart';
import 'package:pokemon_tcg/repositories/navigation/navigation_repository.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationStateInitialized(0));

  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    final navRepo = NavigationRepository.instance;

    if (event is NavigationEventNavigate) {
      navRepo.navigateTo(event.index);
    }
    yield NavigationStateInitialized(navRepo.index!);
  }
}
