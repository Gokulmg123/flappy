import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter_game/game.dart';

class Score extends TextComponent with HasGameRef<flappybird> {
  Score() : super(text: '0');

  @override
  FutureOr<void> onLoad() {
    position =
        Vector2((gameRef.size.x - size.x) / 2, gameRef.size.y - size.y - 50);
  }

  @override
  void update(double dt) {
    final newtext = gameRef.score.toString();
    if (text != newtext) {
      text = newtext;
    }
  }
}
