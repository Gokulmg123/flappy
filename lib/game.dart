import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/component/background.dart';
import 'package:flutter_game/component/bird.dart';
import 'package:flutter_game/component/front.dart';
import 'package:flutter_game/component/ground.dart';
import 'package:flutter_game/component/pipe.dart';
import 'package:flutter_game/component/pipemanager.dart';
import 'package:flutter_game/component/score.dart';
import 'package:flutter_game/constants.dart';

class flappybird extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird b;
  late Background bg;
  late Ground g;
  late pipemanager p;
  late Score s;

  @override
  FutureOr<void> onLoad() {
    bg = Background(size);
    add(bg);
    b = Bird();
    add(b);
    g = Ground();
    add(g);

    p = pipemanager();
    add(p);

    s = Score();
    add(s);
  }

  @override
  void onTap() {
    b.flap();
  }

  int score = 0;
  void scorein() {
    score += 1;
  }

  bool isgameOver = false;

  void gameOver() {
    if (isgameOver) return;

    isgameOver = true;
    pauseEngine();

    showDialog(
        context: buildContext!,
        builder: (context) => AlertDialog(
                title: Text('Game Over'),
                content: Text('highest score$score'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      resetgame();
                    },
                    child: Text("restart"),
                  ),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Front()),);


                  }, child: Text("quit"))
                ]));
  }

  void resetgame() {
    b.position = Vector2(birdstrx, birdstry);
    b.velocity = 0;
    score = 0;
    isgameOver = false;

    children.whereType<Pipe>().forEach((p) => p.removeFromParent());
    resumeEngine();
  }
}
