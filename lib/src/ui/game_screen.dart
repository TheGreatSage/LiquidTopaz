library liquid.ui.game;

import '../engine.dart';

class GameScreen extends Screen<Input> {
  //final Content content;
  //final Storage storage;
  final Actor player;
  final mobs = <Monster>[];
  final Game game;


  GameScreen(this.game): player = new Actor(new Vec(10,10), 100);

  bool handleInput(Input input) {
    switch (input) {
      case Input.cancel: ui.pop(); break;
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
    _drawLog(terminal.rect(0, 34, 80, 6));
    terminal.writeAt(0, 0, 'Health: ' + player.health.current.toString());
  }

  void path() {
    for (Monster _mobs in mobs) {
      // ignore: unused_local_variable
      var path = new CrappyPath(player, _mobs);
    }
  }

  void makeMob() {
    var _mob = new Monster(new Vec(50,10*mobs.length),4);
    mobs.add(_mob);
    game.log.message('Made a mod.');
  }

  void _drawMobs(NormalTerminal terminal) {
    for (Monster _mobs in mobs) {
      terminal.writeAt(_mobs.x, _mobs.y, "M");
    }
  }
  void _drawLog(Terminal terminal) {
    var y = 0;

    for (final message in game.log.messages) {
      var color;
      switch (message.type) {
        case LogType.message: color = Color.WHITE; break;
        case LogType.error: color = Color.RED; break;
        case LogType.quest: color = Color.PURPLE; break;
        case LogType.gain: color = Color.GOLD; break;
        case LogType.help: color = Color.GREEN; break;
      }

      terminal.writeAt(0, y, message.text, color);
      if (message.count > 1) {terminal.writeAt(message.text.length, y, ' (x${message.count})', Color.GRAY);
      }
      y++;
    }
  }

}

