library liquid.testing.main2;
import 'dart:html';

const _CHARS = const [
  r"______   ______                          ______        _____        ",
  r"\ .  /   \  . /                          \  . /        \ . |         ",
  r" | .|     |. |                            |. |          | .|     ",
  r" |. |     | .|   ___________ _____  ____  | .|   ______ |. |        ",
  r" |:::     |::|  /:::::::::::|\:::|  \:::| |::|  /::::::\|::|            ",
  r" |xx|     |xx|  |xx|     |xx| |xx|   |xx| |xx| /xx/     |xx|             ",
  r" |xx|     |xx|  |xx|     |XX| |xx|   |xx| |xx| |xx|     |xx|        ",
  r" |XX|     |XX|  |XX|     |XX| |XX\___|XX| |XX| |XXX\____|XX|          ",
  r" |XX|    /XXXX\ \XXXXXXXXXXX| \XXXX/|XXX\/XXXX\ \XXXXXX/\XXX\         ",
  r" |XX|  __________________|XX|______________________________________",
  r" |XX| |XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\",
  r" |XX|                    |XX|_ ____________________",
  r" |XX|                    |XXX/ |XXXXXXXXXXXXXXXXXX|",
  r" |XXX\                   |XX/  |X/  /XXXXXXXX\  \x|  ",
  r" |XXXX\\.__.//XX\\       |X/   |/      |XX|      \|",
  r"/XXXXXXXXXXXXXXxx\\      |/            |XX|   ___________   ___________    ________ _________",
  r"                                       |XX|  /XXXXXXXXXXX\ /XXXXXXXXXXX\   \XXXXXXX\\XXXXXXXX\",
  r"                                       |XX|  |XX|     |XX| |XX|     |XX|  _____ \XX|  \XX\",
  r"                                       |XX|  |XX|     |XX| |XX|     |XX| /XXXXX\|XX|    \XX\",
  r"                                       /XX\  |XX|     |XX| |XX|     |XX||XX(____|XX|      \XX\",
  r"                                      /XXXX\ \XXXXXXXXXXX/ |XXXXXXXXXXX/ \XXXXXX/\XX\/XXXXXXXX/           ",
  r"                               ____________________________|XX|________________________________            ",
  r"                              |XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\                    ",
  r"                                                           |XX|_",
  r"                                                           |XXX/",
  r"                                                           |XX/",
  r"                                                           |X/",
  r"                                                           |/",

];
class Char {

  final int char;
  static const DERP = const Char.fromCharCode(0x0020);

  Char(String char): char = char.codeUnits[0];

  const Char.fromCharCode(this.char);



}

class Color {
  static const BLACK        = const Color('#000');
  static const WHITE        = const Color('#ffffff');

  static const LIGHT_GRAY   = const Color('rgb(192, 192, 192)');
  static const GRAY         = const Color('rgb(128, 128, 128)');
  static const DARK_GRAY    = const Color('rgb(64, 64, 64)');

  static const LIGHT_RED    = const Color('rgb(255, 160, 160)');
  static const RED          = const Color('rgb(220, 0, 0)');
  static const DARK_RED     = const Color('rgb(100, 0, 0)');

  static const LIGHT_ORANGE = const Color('rgb(255, 200, 170)');
  static const ORANGE       = const Color('rgb(255, 128, 0)');
  static const DARK_ORANGE  = const Color('rgb(128, 64, 0)');

  static const LIGHT_GOLD   = const Color('rgb(255, 230, 150)');
  static const GOLD         = const Color('rgb(255, 192, 0)');
  static const DARK_GOLD    = const Color('rgb(128, 96, 0)');

  static const LIGHT_YELLOW = const Color('rgb(255, 255, 150)');
  static const YELLOW       = const Color('rgb(255, 255, 0)');
  static const DARK_YELLOW  = const Color('rgb(128, 128, 0)');

  static const LIGHT_GREEN  = const Color('rgb(130, 255, 90)');
  static const GREEN        = const Color('rgb(0, 128, 0)');
  static const DARK_GREEN   = const Color('rgb(0, 64, 0)');

  static const LIGHT_AQUA   = const Color('rgb(128, 255, 255)');
  static const AQUA         = const Color('rgb(0, 255, 255)');
  static const DARK_AQUA    = const Color('rgb(0, 128, 128)');

  static const LIGHT_BLUE   = const Color('rgb(128, 160, 255)');
  static const BLUE         = const Color('rgb(0, 64, 255)');
  static const DARK_BLUE    = const Color('rgb(0, 37, 168)');

  static const LIGHT_PURPLE = const Color('rgb(200, 140, 255)');
  static const PURPLE       = const Color('rgb(128, 0, 255)');
  static const DARK_PURPLE  = const Color('rgb(64, 0, 128)');

  static const LIGHT_BROWN  = const Color('rgb(190, 150, 100)');
  static const BROWN        = const Color('rgb(160, 110, 60)');
  static const DARK_BROWN   = const Color('rgb(100, 64, 32)');
  final String cssColor;

  const Color(this.cssColor);

}
main() {
  CanvasElement _canvas;
  CanvasRenderingContext2D _contex;
  _canvas = (new CanvasElement());
  _contex = _canvas.context2D;
  _canvas.height = 13*40;
  _canvas.width = 9*100;
  _canvas.style.color = Color.GOLD;

  _contex.font = '13px, sans-serif';

  //_contex.fillStyle = Color.BLACK;
  //_contex.fillRect(0,0,9*100,13*40);


  for (var y = 0; y < _CHARS.length; y++) {
    for (var x = 0; x < _CHARS[y].length; x++) {

        _contex.fillText(_CHARS[y][x],x*9+0,y*13+21);
      }
    }

  querySelector("#game").append(_canvas);
}