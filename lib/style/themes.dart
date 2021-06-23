import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var appTheme = ThemeData(
  primaryColor: Colors.deepPurple,
  accentColor: Colors.yellow,
  textTheme: textTheme,
);

var textTheme = TextTheme(
  subtitle1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
  subtitle2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
  bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
);
//elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle()),
