import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/component/front.dart';
import 'package:flutter_game/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Front()
      //GameWidget(game: flappybird()),
    );
  }
}
