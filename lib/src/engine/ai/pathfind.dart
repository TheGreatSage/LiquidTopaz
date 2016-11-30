library liquid.engine.ai.paths;

import '../../engine.dart';

class CrappyPath {
  final Actor player;
  final Monster mob;
  CrappyPath(Actor player, Monster mob): mob = mob, player = player{
    //TODO: Crappy Fix this
    if (mob.y > player.y) {
      mob.move('n');
    } else if (mob.y < player.y) {
      mob.move('s');
    } else if (mob.x > player.x+1 ) {
      mob.move('w');
    } else if (mob.x < player.x-1) {
      mob.move('e');
    } else {
      mob.move();
    }
  }
}