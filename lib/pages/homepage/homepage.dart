import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Pokémon TCG Manager')),
        body: Center(
          child: Container(
              width: 100.0, height: 100.0, color: Colors.deepPurple.shade300),
        ));
  }
}
