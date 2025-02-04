import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_game/component/ground.dart';
import 'package:flutter_game/component/pipe.dart';
import 'package:flutter_game/constants.dart';
import 'package:flutter_game/game.dart';

class Bird extends SpriteComponent with CollisionCallbacks {
  Bird()
      : super(
            position: Vector2(birdstrx, birdstry),
            size: Vector2(birdwidth, birdheight));

  double velocity = 100;
  // double gravity = 10000;
  // final double jumpstr = -300;

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load('bird.png');
    add(RectangleHitbox());
  }

  void flap() {
    velocity = jumpstr;
  }

  @override
  void update(double dt) {
    velocity += gravity * dt;
    position.y += velocity * dt;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);

    if (other is Ground) {
      (parent as flappybird).gameOver();
    }

    if (other is Pipe) {
      (parent as flappybird).gameOver();
    }
  }
}
