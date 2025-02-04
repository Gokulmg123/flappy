import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_game/constants.dart';
import 'package:flutter_game/game.dart';

class Pipe extends SpriteComponent
    with CollisionCallbacks, HasGameRef<flappybird> {
  final bool istoppipe;
  bool scored = false;
  Pipe(Vector2 position, Vector2 size, {required this.istoppipe})
      : super(position: position, size: size);

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load(istoppipe ? 'uppiller.png' : 'downpiller.png');
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    position.x -= gspeed;

    if (!scored && position.x + size.x < gameRef.b.position.x) {
      scored = true;
      if (istoppipe) {
        gameRef.scorein();
      }
    }

    if (position.x + position.y <= 0) {
      removeFromParent();
    }
  }
}
