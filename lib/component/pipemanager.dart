import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter_game/component/pipe.dart';
import 'package:flutter_game/constants.dart';
import 'package:flutter_game/game.dart';

class pipemanager extends Component with HasGameRef<flappybird> {
  double pipetime = 0;

  @override
  void update(double dt) {
    pipetime += dt;
    const pipeinterval = 2;
    if (pipetime > pipeinterval) {
      pipetime = 0;
      spawnpipe();
    }
  }

  void spawnpipe() {
    final double screenheight = gameRef.size.y;
    const double pipegap = 250;
    const double minheight = 50;
    const double pipewidth = 60;

    final double maxheight = screenheight - groundheight - pipegap - minheight;

    final double bottomheight =
        minheight + Random().nextDouble() * (maxheight - minheight);

    final double topheight =
        screenheight - groundheight - bottomheight - pipegap;

    final bottompipe = Pipe(
        Vector2(gameRef.size.x, screenheight - groundheight - bottomheight),
        Vector2(pipewidth, bottomheight),
        istoppipe: false);

    final toppipe = Pipe(
        Vector2(gameRef.size.x, 0), Vector2(pipewidth, topheight),
        istoppipe: true);

    gameRef.add(bottompipe);
    gameRef.add(toppipe);
  }
}
