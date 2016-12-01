library liquid.ui.main_menu_screen;

import '../engine.dart';
import 'confirm_dialog.dart';
import 'new_hero_screen.dart';
import 'game_screen.dart';

// TODO: Replace With TOPAZ

const _CHARS = const [
  r"______   ______                          ______        _____",
  r"\ .  /   \  . /                          \  . /        \ . |",
  r" | .|     |. |                            |. |          | .|",
  r" |. |     | .|   ___________ _____  ____  | .|   ______ |. |",
  r" |:::     |::|  /:::::::::::|\:::|  \:::| |::|  /::::::\|::|",
  r" |xx|     |xx|  |xx|     |xx| |xx|   |xx| |xx| /xx/     |xx|",
  r" |xx|     |xx|  |xx|     |XX| |xx|   |xx| |xx| |xx|     |xx|",
  r" |XX|     |XX|  |XX|     |XX| |XX\___|XX| |XX| |XXX\____|XX|",
  r" |XX|    /XXXX\ \XXXXXXXXXXX| \XXXX/|XXX\/XXXX\ \XXXXXX/\XXX\",
  r" |XX|  __________________|XX|______________________________________",
  r" |XX| |XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\",
  r" |XX|                    |XX|_ ____________________",
  r" |XX|                    |XXX/ |XXXXXXXXXXXXXXXXXX|",
  r" |XXX\                   |XX/  |X/  /XXXXXXXX\  \x|",
  r" |XXXX\\.__.//XX\\       |X/   |/      |XX|      \|",
  r"/XXXXXXXXXXXXXXxx\\      |/            |XX|   ___________   ___________    ________  ________",
  r"                                       |XX|  /XXXXXXXXXXX\ /XXXXXXXXXXX\   \XXXXXXX\ \XXXXXXX\",
  r"                                       |XX|  |XX|     |XX| |XX|     |XX|  _____ \XX|   \XX\",
  r"                                       |XX|  |XX|     |XX| |XX|     |XX| /XXXXX\|XX|    \XX\",
  r"                                       /XX\  |XX|     |XX| |XX|     |XX||XX(____|XX|     \XX\",
  r"                                      /XXXX\ \XXXXXXXXXXX/ |XXXXXXXXXXX/ \XXXXXX/\XX\/XXXXXXX\",
  r"                               ____________________________|XX|________________________________",
  r"                              |XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\",
  r"                                                           |XX|_",
  r"                                                           |XXX/",
  r"                                                           |XX/",
  r"                                                           |X/",
  r"                                                           |/",

];
const _CHAR_COLORS = const [
  "LLLLLL   LLLLLL                          LLLLLL       LLLLLL",
  "ERRRRE   ERRRRE                          ERRRRE        ERRRE",
  " ERRE     ERRE                            ERRE          ERRE",
  " ERRE     ERRE  LLLLLLLLLLLL LLLLL  LLLL  ERRE   LLLLLL ERRE",
  " ERRE     ERRE  ERRRRRRRRRRREERRRE  ERRRE ERRE  ERRRRRREERRE",
  " EOOE     EOOE  EOOE     EOOE EOOE   EOOE EOOE EOOE     EOOE",
  " EOOE     EOOE  EOOE     EOOE EOOE   EOOE EOOE EOOE     EOOE",
  " EOOE     EOOE  EOOE     EOOE EOOELLLEOOE EOOE EOOOELLLLEOOE",
  " EOOE    EOOOOE EOOOOOOOOOOOE EOOOOEEOOOEEOOOOE EOOOOOOEEOOOE",
  " EOOE  LLLLLLLLLLLLLLLLLLEOOELLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL",
  " EOOE EOOOOOOOOOOOOOOOOOOEOOEOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOE",
  " EOOE                    EOOEL LLLLLLLLLLLLLLLLLLLL",
  " EOOE                    EOOOE EOOOOOOOOOOOOOOOOOOE",
  " EOOOE                   EOOE  EOE  EOOOOOOOOE  EOE",
  " EYYYYEELLLLEEYYEE       EYE   EE      EYYE      EE",
  "EYYYYYYYYYYYYYYYYEE      EE            EYYE   LLLLLLLLLLL   LLLLLLLLLLL    LLLLLLLL  LLLLLLLL",
  "                                       EYYE  EYYYYYYYYYYYE EYYYYYYYYYYYE   EYYYYYYYE EYYYYYYYE",
  "                                       EYYE  EYYE     EYYE EYYE     EYYE  LLLLL EYYE   EYYE",
  "                                       EAAE  EAAE     EAAE EAAE     EAAE EAAAAAEEAAE    EAAE",
  "                                       EAAE  EAAE     EAAE EAAE     EAAEEAAELLLLEAAE     EAAE",
  "                                      EAAAAE EAAAAAAAAAAAE EAAAAAAAAAAAE EAAAAAAEEAAEEAAAAAAAE",
  "                               LLLLLLLLLLLLLLLLLLLLLLLLLLLLEBBELLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL",
  "                              EBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBE",
  "                                                           EBBEL",
  "                                                           EBBBE",
  "                                                           EBBE",
  "                                                           EBE",
  "                                                           EE",
];

const _COLORS =  const{
  "L": Color.LIGHT_GRAY,
  "E": Color.GRAY,
  "R": Color.RED,
  "O": Color.ORANGE,
  "G": Color.GOLD,
  "Y": Color.YELLOW,
  "A": Color.AQUA,
  "B": Color.BLUE
};


class MainMenuScreen extends Screen<Input> {
  final Content content;
  final Storage storage;
  int selectedHero = 0;
  MainMenuScreen(Content content) : content = content, storage = new Storage(content);

  bool handleInput(Input input) {
    switch (input) {
      case Input.n: _changeSelection(-1); return true;
      case Input.s: _changeSelection(1); return true;
      case Input.ok:
        if (selectedHero < storage.heroes.length) {
          var game = new Game(content, storage);
          ui.push(new GameScreen(game));
        }
        return true;
    }
    return false;
  }


  bool keyDown(int keyCode, {bool shift, bool alt}) {
    if (shift || alt) return false;
    switch (keyCode) {
      case KeyCode.d:
        if (selectedHero < storage.heroes.length) {
          //ui.push(new ConfirmDialog("Are you sure you want to delete this hero?", 'delete'));
        }
        return true;
      case KeyCode.n:
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

  void render(NormalTerminal terminal) {
    terminal.clear();
    for (var y = 0; y < _CHARS.length; y++) {
      for (var x = 0; x < _CHARS[y].length; x++) {
        var color = _COLORS[_CHAR_COLORS[y][x]];
        terminal.writeAt(x + 4, y + 1, _CHARS[y][x], color);
      }
    }


    terminal.writeAt(10, 18,
        'Which hero shall you play?');
    terminal.writeAt(0, terminal.height - 1,
        '[L] Select a hero, [↕] Change selection, [N] Create a new hero, [D] Delete hero', Color.GRAY);


    if (storage.heroes.length == 0) {
      terminal.writeAt(10, 20, '(No heroes. Make a new one.)', Color.GRAY);
    }

    for (var i = 0; i < storage.heroes.length; i++) {
      var hero = storage.heroes[i];

      var fore = Color.WHITE;
      var back = Color.BLACK;
      if (i == selectedHero) {
        fore = Color.BLACK;
        back = Color.YELLOW;
      }

      terminal.writeAt(11, 20 + i, hero.name, fore, back);
    }



  }

  void _changeSelection(int offset) {
    selectedHero = (selectedHero + offset) % storage.heroes.length;
    dirty();
  }


}

