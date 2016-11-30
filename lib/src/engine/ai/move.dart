library liquid.ai.move;
import '../../engine.dart';
import 'pathfind.dart';

class Move {
  //final num rate;
  final Monster monst;

  Move(Actor mob): monst = mob;

  void random() {
    //var mob = monst;
    int dir = rng.range(1,5);

    switch (dir) {
      case 1: move('east'); break;
      case 2: move('west'); break;
      case 3: move('south'); break;
      case 4: move('north'); break;
    }
  }

  void move(String dir) {
    var mob = monst;
    switch (dir) {
      case 'east': mob.x+=1; break;
      case 'west': mob.x-=1; break;
      case 'south': mob.y+=1; break;
      case 'north': mob.y-=1; break;
      default: random(); break;
    }
  }

}