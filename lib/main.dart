import 'package:flutter/material.dart';
import 'package:superhero_app/screens/mainscreen.dart';
import 'package:superhero_app/utils/constants.dart';

void main() => runApp((MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SuperHero App',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      theme: Constants.lightTheme,
    );
  }
}
