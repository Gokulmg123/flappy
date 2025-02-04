import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_game/constants.dart';
import 'package:flutter_game/game.dart';

class Ground extends SpriteComponent
    with HasGameRef<flappybird>, CollisionCallbacks {
  Ground() : super();

  @override
  FutureOr<void> onLoad() async {
    size = Vector2(2 * gameRef.size.x, groundheight);
    position = Vector2(0, gameRef.size.y - groundheight);

    sprite = await Sprite.load('ground.png');
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    position.x -= gspeed * dt;

    if (position.x + size.x / 2 <= 0) {
      position.x = 0;
    }
  }
}
