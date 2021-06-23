import 'package:flutter/material.dart';
import 'package:pokemon_tcg/routes/routes.dart';
import 'package:pokemon_tcg/style/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
