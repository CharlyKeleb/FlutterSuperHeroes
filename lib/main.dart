import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superhero_app/screens/mainscreen.dart';
import 'package:superhero_app/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child){
          return  MaterialApp(
            title: 'SuperHero App',
            debugShowCheckedModeBanner: false,
            home: MainScreen(),
            theme: notifier.dark ? Constants.darkTheme : Constants.lightTheme,
          );
        },

      ),
    );
  }
}
