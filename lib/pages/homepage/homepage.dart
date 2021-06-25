import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_tcg/blocs/navigation/navigation_bloc.dart';
import 'package:pokemon_tcg/blocs/navigation/navigation_events.dart';
import 'package:pokemon_tcg/blocs/navigation/navigation_states.dart';
import 'package:pokemon_tcg/blocs/shared_preferences/shared_preferences_bloc.dart';
import 'package:pokemon_tcg/blocs/shared_preferences/shared_preferences_events.dart';
import 'package:pokemon_tcg/blocs/shared_preferences/shared_preferences_states.dart';
import 'package:pokemon_tcg/repositories/navigation/navigation_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SharedPreferencesBloc, SharedPreferencesState>(
        builder: (context, state) {
      if (state is SharedPreferencesStateUninitialized) {
        return CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        );
      } else if (state is SharedPreferencesStateInitialized) {
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
      } else {
        return Text('State unknwon');
      }
    });
  }

  @override
  void afterFirstLayout(BuildContext context) {
    BlocProvider.of<SharedPreferencesBloc>(context)
        .add(SharedPreferencesEventGet());
  }
}
