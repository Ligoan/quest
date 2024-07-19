import 'package:flutter/material.dart';
import 'config_screen.dart';
import 'home_screen.dart';
import 'learn_screen.dart';
import 'content_play_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      routes: {
        '/config': (context) => ConfigScreen(),
        '/learn': (context) => LearnScreen(),
        '/content': (context) => ContentPlayScreen(),
      },
    );
  }
}
