import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../game.dart';
class front2 extends StatelessWidget {
  const front2({super.key});

  @override
  Widget build(BuildContext context) {
    return
   MaterialApp(
      home: GameWidget(game: flappybird()),
    );
  }
}

