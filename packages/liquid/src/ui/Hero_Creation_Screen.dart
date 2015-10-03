library liquid.ui.Hero_Creation_Screen;

import 'package:malison/malison.dart';
import 'package:piecemeal/piecemeal.dart';

import '../content.dart';
import 'input.dart';
import '../engine.dart';
import 'storage.dart';
import 'main_menu_screen.dart';

const _DEFAULT_NAMES = const ["Sage", "Sage Martin", "Sage is God"];

class HeroCreation extends Screen {
  final Content content;
  final Storage storage;

  String defaultName = rng.item(_DEFAULT_NAMES);
  String name = "";

  HeroCreation(this.content, this.storage) {}

  bool keyDown(int keyCode, {bool shift, bool alt}) {
    // TODO: Figuring out the char code manually here is lame. Pass it in from
    // the KeyEvent?

    switch (keyCode) {
      case KeyCode.ENTER:
        var hero = content.createHero(name.isEmpty ? defaultName : name);
        storage.heroes.add(hero);
        storage.save();
        ui.goTo(new MainMenuScreen(content));
        break;

      case KeyCode.ESCAPE:
        ui.pop();
        break;

      case KeyCode.DELETE:
        if (name.length > 0) {
          name = name.substring(0, name.length - 1);

          // Pick a new random name.
          if (name.length == 0) {
            defaultName = rng.item(_DEFAULT_NAMES);
          }

          dirty();
        }
        break;

      case KeyCode.SPACE:
        name = '$name ';
        dirty();
        break;

      default:
        var key = keyCode;
        if (key == null) break;

        if (key >= KeyCode.A && key <= KeyCode.Z) {
          var charCode = key;
          // TODO: Handle other modifiers.
          if (!shift) {
            charCode = 'a'.codeUnits[0] - 'A'.codeUnits[0] + charCode;
          }

          name += new String.fromCharCodes([charCode]);
          dirty();
        } else if (key >= KeyCode.ZERO && key <= KeyCode.NINE) {
          name += new String.fromCharCodes([key]);
          dirty();
        }

        break;
    }

    return true;
  }

  void render(Terminal terminal) {
    terminal.clear();

    terminal.writeAt(0, 0,
    "What name shall the bards use to sing of your hero's adventures?");

    if (name.isEmpty) {
      terminal.writeAt(0, 2, defaultName, Color.BLACK, Color.YELLOW);
    } else {
      terminal.writeAt(0, 2, name);
      terminal.writeAt(name.length, 2, " ", Color.BLACK, Color.YELLOW);
    }

    terminal.writeAt(0, terminal.height - 1,
    '[A-Z] Enter name, [Del] Delete letter, [Enter] Create hero, [Esc] Cancel', Color.GRAY);

    dirty();
  }
}