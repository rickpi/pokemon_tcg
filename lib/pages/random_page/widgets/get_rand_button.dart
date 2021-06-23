import 'package:flutter/material.dart';
import 'package:pokemon_tcg/style/purple_button.dart';

class RandomButton extends StatelessWidget {
  const RandomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PurpleButton(onPressed: () {}, child: Text('Get a pokémon'));
  }
}
