library liquid.ui.new_hero_screen;

import '../engine.dart';
import 'game_screen.dart';

// From: http://medieval.stormthecastle.com/medieval-names.htm.
const _defaultNames = const [
  "Merek", "Carac", "Ulric", "Tybalt", "Borin", "Sadon", "Terrowin", "Rowan",
  "Forthwind", "Althalos", "Fendrel", "Brom", "Hadrian", "Crewe", "Bolbec",
  "Fenwick", "Mowbray", "Drake", "Bryce", "Leofrick", "Letholdus", "Lief",
  "Barda", "Rulf", "Robin", "Gavin", "Terrin", "Jarin", "Cedric", "Gavin",
  "Josef", "Janshai", "Doran", "Asher", "Quinn", "Xalvador", "Favian",
  "Destrian", "Dain", "Millicent", "Alys", "Ayleth", "Anastas", "Alianor",
  "Cedany", "Ellyn", "Helewys", "Malkyn", "Peronell", "Thea", "Gloriana",
  "Arabella", "Hildegard", "Brunhild", "Adelaide", "Beatrix", "Emeline",
  "Mirabelle", "Helena", "Guinevere", "Isolde", "Maerwynn", "Catrain",
  "Gussalen", "Enndolynn", "Krea", "Dimia", "Aleida"
];

class NewHeroScreen extends Screen<Input> {
  final Content content;
  final Storage storage;

  String defaultName = rng.item(_defaultNames);
  String name = "";

  NewHeroScreen(this.content, this.storage) {}

  bool keyDown(int keyCode, {bool shift, bool alt}) {
    // TODO: Figuring out the char code manually here is lame. Pass it in from
    // the KeyEvent?

    switch (keyCode) {
      case KeyCode.enter:
      // TODO: Other classes.
        //var heroClass = new Warrior();
        var hero = content.createHero(name.isEmpty ? defaultName : name);
        storage.heroes.add(hero);
        storage.save();
        var game = new Game(content, storage);
        ui.goTo(new GameScreen(game));
        break;

      case KeyCode.escape:
        ui.pop();
        dirty();
        break;

      case KeyCode.delete:
        if (name.length > 0) {
          name = name.substring(0, name.length - 1);

          // Pick a new random name.
          if (name.length == 0) {
            defaultName = rng.item(_defaultNames);
          }

          dirty();
        }
        break;

      case KeyCode.space:
      // TODO: Handle modifiers.
        name = '$name ';
        dirty();
        break;

      default:
        var key = keyCode;
        if (key == null) break;

        if (key >= KeyCode.a && key <= KeyCode.z) {
          var charCode = key;
          // TODO: Handle other modifiers.
          if (!shift) {
            charCode = 'a'.codeUnits[0] - 'A'.codeUnits[0] + charCode;
          }

          name += new String.fromCharCodes([charCode]);
          dirty();
        } else if (key >= KeyCode.zero && key <= KeyCode.nine) {
          name += new String.fromCharCodes([key]);
          dirty();
        }

        break;
    }

    return true;
  }

  void render(NormalTerminal terminal) {
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
  }


}