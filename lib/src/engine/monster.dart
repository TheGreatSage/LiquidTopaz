library liquid.engine.mob;

import '../backbone/math/vec.dart';
import 'actor.dart';
import 'ai/move.dart';

class Monster extends Actor {
  Monster(Vec pos, int health) : super(pos, health);

  void move([String dir]) {
    var mob = new Move(this);
    switch (dir) {
      case 'n': mob.move('north'); break;
      case 's': mob.move('south'); break;
      case 'w': mob.move('west'); break;
      case 'e': mob.move('east'); break;
      default: mob.random(); break;
    }
    //mob.random();
  }
}