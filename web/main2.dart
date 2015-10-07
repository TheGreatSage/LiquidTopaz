library liquid.testing.main2;
import 'dart:html';
import 'tester.dart';
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


main() {
  CanvasElement _canvas;
  CanvasRenderingContext2D _contex;
  _canvas = (new CanvasElement());

  _contex = _canvas.context2D;

  _canvas.height = 13*40;
  _canvas.width = 9*100;


  _contex.font = '13px, sans-serif';

  _contex.fillStyle = Color.BLACK;
  _contex.fillRect(0,0,9*100,13*40);


  for (var y = 0; y < _CHARS.length; y++) {
    for (var x = 0; x < _CHARS[y].length; x++) {
        _contex.fillStyle = Color.WHITE;
        _contex.fillText(_CHARS[y][x],x*9+0,y*13+21);
      }
    }
  _contex.fillStyle = Color.RED;
  _contex.fillText("TTTT",0,13);
  querySelector("#game").append(_contex.canvas);

}