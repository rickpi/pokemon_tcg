import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_tcg/blocs/navigation/navigation_bloc.dart';
import 'package:pokemon_tcg/blocs/navigation/navigation_events.dart';
import 'package:pokemon_tcg/blocs/navigation/navigation_states.dart';
import 'package:pokemon_tcg/pages/random_page/random_page.dart';
import 'package:pokemon_tcg/repositories/navigation/navigation_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        if (state is NavigationStateInitialized) {
          var navItems = NavigationRepository.instance.navItems;

          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: navItems[state.index]['widget'],
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Theme.of(context).primaryColor,
                items: [
                  for (var item in navItems)
                    BottomNavigationBarItem(
                        icon: Icon(item['icon']), label: item['label'])
                ],
                currentIndex: state.index,
                selectedItemColor: Colors.white,
                showUnselectedLabels: false,
                onTap: (int index) {
                  BlocProvider.of<NavigationBloc>(context)
                      .add(NavigationEventNavigate(index));
                }),
          );
        } else {
          return Text('Unknown state');
        }
      },
    );
  }
}
