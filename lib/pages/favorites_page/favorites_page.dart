import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your favorites',
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
                color: Colors.white),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
    ;
  }
}
