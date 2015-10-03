library hauberk.ui.main_menu_screen;

import 'package:malison/malison.dart';

import '../engine.dart';
import 'confirm_dialog.dart';
import 'input.dart';
import 'new_hero_screen.dart';
import 'select_level_screen.dart';
import 'storage.dart';


const _CHARS = const [
  r"______   ______                            ______        _____        ",
  r"\ .  /   \  . /                            \  . /        \ . |         ",
  r" | .|     |. |                              |. |          | .|     ",
  r" |. |     | .|    __________   _____  _____ | .|          |. |        ",
  r" |:::     |::|   /::::::::::\  \:::|  \:::| |::|   /:::::\|::|            ",
  r" |xx|     |xx|   |xx|    |xx|   |xx|   |xx| |xx| /xx/     |xx|             ",
  r" |xx|     |xx|   |xx|    |\\|   |xx|   |xx| |xx| |xx|     |xx|        ",
  r" |XX|     |XX|   |XX|   \\X\\   |XX\___|XX| |XX| |XXX\____|XX|          ",
  r" |XX|    /XXXX\  \XXXXXXXX\\X\\ \XXXX/|XXX\/XXXX\ \XXXXXX/\XXX\         ",
  r" |XX|  ____________________________________________________________________________",
  r" |XX| |XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\",
  r" |XX|",
  r" |XX|",
  r" |XXX\\______//\\",
  r" |XXXX\\.__.//XX\\",
  r"/XXXXXXXXXXXXXXxx\\",
];

const _CHAR_COLORS = const [
  "LLLLLL   LLLLLL                          LLLLL                               LLLLL",
  "ERRRRE   ERRRRE                          ERRRE                               ERRRE",
  " ERRE     ERRE                            ERRE                                ERRE",
  " ERRELLLLLERRE    LLLLLLL   LLLLL  LLLLL  ERRE LLLLL      LLLLLLL  LLLL  LLLL ERRE   LLLL",
  " ERRREEEEERRRE    ERRRRRRL  ERRRE  ERRRE  ERREERRRRRL    LRRRRRRRL ERRRLLRRRRLERRE  LRRE",
  " ERRE     ERRE   LLLLL ERRE  ERRE   ERRE  ERRE    ERRL  ERRELLLERRE ERRE   EREERRELLRE",
  " EOOE     EOOE  LOOOOOEEOOE  EOOE   EOOE  EOOE     EOOE EOOEEOOOOOE EOOE      EOOOOOOOL",
  " EGGE     EGGE EGGELLLLEGGE  EGGLLLLEGGE  EGGELLLLLGGGE EGGELLLLLL  EGGE      EGGE  EGGLL",
  " EYYE     EYYE  EYYYYYYEEYYE  EYYYY/EYYYLLYYYEEYYYYYYE   EYYYYYYYE LYYYYL    LYYYYL  EYYYL",
  " EYYE     EYYE LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL",
  " EYYE     EYYE EYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYL",
  "LEYYE     EYYEL",
  "EYYYE     EYYYE",
  " EYYE     EYYE",
  "  EYE     EYE",
  "   EE     EE",
];

const _COLORS = const {
  "L": Color.LIGHT_GRAY,
  "E": Color.GRAY,
  "R": Color.RED,
  "O": Color.ORANGE,
  "G": Color.GOLD,
  "Y": Color.YELLOW
};

class MainMenuScreen extends Screen {
  final Content content;
  final Storage storage;
  int selectedHero = 0;

  MainMenuScreen(Content content)
      : content = content,
        storage = new Storage(content);

  bool handleInput(Input input) {
    switch (input) {
      case Input.N: _changeSelection(-1); return true;
      case Input.S: _changeSelection(1); return true;

      case Input.OK:
        if (selectedHero < storage.heroes.length) {
          ui.push(new SelectLevelScreen(content, storage.heroes[selectedHero],
              storage));
        }
        return true;
    }

    return false;
  }

  bool keyDown(int keyCode, {bool shift, bool alt}) {
    if (shift || alt) return false;

    switch (keyCode) {
      case KeyCode.D:
        if (selectedHero < storage.heroes.length) {
          ui.push(new ConfirmDialog(
              "Are you sure you want to delete this hero?", 'delete'));
        }
        return true;

      case KeyCode.N:
        ui.push(new NewHeroScreen(content, storage));
        return true;
    }

    return false;
  }

  void activate(Screen screen, result) {
    if (screen is ConfirmDialog && result == 'delete') {
      storage.heroes.removeAt(selectedHero);
      if (selectedHero >= storage.heroes.length) selectedHero--;
      storage.save();
      dirty();
    }
  }

  void render(Terminal terminal) {
    for (var y = 0; y < _CHARS.length; y++) {
      for (var x = 0; x < _CHARS[y].length; x++) {
        var color = _COLORS[_CHAR_COLORS[y][x]];
        terminal.writeAt(x + 4, y + 1, _CHARS[y][x], color);
      }
    }

    terminal.writeAt(25, 18,
        'Which hero shall you play?');
    terminal.writeAt(0, terminal.height - 1,
        '[L] Select a hero, [?] Change selection, [N] Create a new hero, [D] Delete hero',
        Color.GRAY);

    if (storage.heroes.length == 0) {
      terminal.writeAt(25, 20, '(No heroes. Please create a new one.)',
          Color.GRAY);
    }

    for (var i = 0; i < storage.heroes.length; i++) {
      var hero = storage.heroes[i];

      var fore = Color.WHITE;
      var secondaryFore = Color.GRAY;
      var back = Color.BLACK;
      if (i == selectedHero) {
        fore = Color.BLACK;
        secondaryFore = Color.WHITE;
        back = Color.YELLOW;
      }

      terminal.writeAt(26, 20 + i, hero.name, fore, back);
      terminal.writeAt(45, 20 + i, "Level ${hero.level}", secondaryFore);
      terminal.writeAt(55, 20 + i, hero.heroClass.name, secondaryFore);
    }
  }

  void _changeSelection(int offset) {
    selectedHero = (selectedHero + offset) % storage.heroes.length;
    dirty();
  }
}