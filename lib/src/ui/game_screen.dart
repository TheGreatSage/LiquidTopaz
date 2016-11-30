library liquid.ui.game;

import '../engine.dart';

class GameScreen extends Screen<Input> {
  final Content content;
  final Storage storage;
  final Actor player;
  final mobs = <Monster>[];
  //final Monster mob;


  GameScreen(this.content, this.storage): player = new Actor(new Vec(10,10), 100);

  bool handleInput(Input input) {
    switch (input) {
      case Input.cancel:
        ui.pop();
        break;
      case Input.n: player.y -= 1; path(); dirty(); break;
      case Input.s: player.y += 1; path(); dirty(); break;
      case Input.e: player.x += 1; path(); dirty(); break;
      case Input.w: player.x -= 1; path(); dirty(); break;
      //case Input.nw: mob.move('w'); dirty(); break;
      //case Input.ne: mob.move('n'); dirty(); break;
      //case Input.sw: mob.move('s'); dirty(); break;
      //case Input.se: mob.move('e'); dirty(); break;
      case Input.ok: makeMob(); dirty(); break;

    }
    return true;
  }

  void render(NormalTerminal terminal) {
    terminal.writeAt(player.x,player.y,"@");
    _drawMobs(terminal);
    terminal.writeAt(0, terminal.height - 1, 'Health: ' + player.health.current.toString());
  }

  void path() {
    for (Monster _mobs in mobs) {
      var path = new CrappyPath(player, _mobs);
    }
  }

  void makeMob() {
    var _mob = new Monster(new Vec(50,10*mobs.length),4);
    mobs.add(_mob);
  }

  void _drawMobs(NormalTerminal terminal) {
    for (Monster _mobs in mobs) {
      terminal.writeAt(_mobs.x, _mobs.y, "M");
    }
  }
}