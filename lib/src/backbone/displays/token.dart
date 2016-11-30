library liquid.bb.display.token;

import 'package:quiver/core.dart';

const MENUCHARSCHARS = const [
  r"______   ______                          ______        _____        ",
  r"\ .  /   \  . /                          \  . /        \ . |         ",
  r" | .|     |. |                            |. |          | .|     ",
  r" |. |     | .|   ___________ _____  ____  | .|   ______ |. |        ",
  r" |::|     |::|  /:::::::::::|\:::|  \:::| |::|  /::::::\|::|            ",
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
  r"                                       |XX|  /XXXXXXXXXXX\ |XXXXXXXXXXX\   \XXXXXXX\\XXXXXXXX|",
  r"                                       |XX|  |XX|     |XX| |XX|     |XX|  _____ \XX|  \XX\",
  r"                                       |XX|  |XX|     |XX| |XX|     |XX| /XXXXX\|XX|    \XX\",
  r"                                       /XX\  |XX|     |XX| |XX|     |XX||XX(____|XX|      \XX\",
  r"                                      /XXXX\ \XXXXXXXXXXX/ |XXXXXXXXXXX/ \XXXXXX/\XX\/XXXXXXXX|           ",
  r"                               ____________________________|XX|________________________________            ",
  r"                              |XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\                    ",
  r"                                                           |XX|_",
  r"                                                           |XXX/",
  r"                                                           |XX/",
  r"                                                           |X/",
  r"                                                           |/",

];


class Color {

  static const String BLACK  = '#000';
  static const String WHITE  = '#ffffff';

  static const String LIGHT_GRAY   = 'rgb(192, 192, 192)';
  static const String GRAY         = 'rgb(128, 128, 128';
  static const String DARK_GRAY    = 'rgb(64, 64, 64)';

  static const String LIGHT_RED    = 'rgb(255, 160, 160)';
  static const String RED          = 'rgb(220, 0, 0)';
  static const String DARK_RED     = 'rgb(100, 0, 0)';

  static const String LIGHT_ORANGE = 'rgb(255, 200, 170)';
  static const String ORANGE       = 'rgb(255, 128, 0)';
  static const String DARK_ORANGE  = 'rgb(128, 64, 0)';

  static const String LIGHT_GOLD   = 'rgb(255, 230, 150)';
  static const String GOLD         = 'rgb(255, 192, 0)';
  static const String DARK_GOLD    = 'rgb(128, 96, 0)';

  static const String LIGHT_YELLOW = 'rgb(255, 255, 150)';
  static const String YELLOW       = 'rgb(255, 255, 0)';
  static const String DARK_YELLOW  = 'rgb(128, 128, 0)';

  static const String LIGHT_GREEN  = 'rgb(130, 255, 90)';
  static const String GREEN        = 'rgb(0, 128, 0)';
  static const String DARK_GREEN   = 'rgb(0, 64, 0)';

  static const String LIGHT_AQUA   = 'rgb(128, 255, 255)';
  static const String AQUA         = 'rgb(0, 255, 255)';
  static const String DARK_AQUA    = 'rgb(0, 128, 128)';

  static const String LIGHT_BLUE   = 'rgb(128, 160, 255)';
  static const String BLUE         = 'rgb(0, 64, 255)';
  static const String DARK_BLUE    = 'rgb(0, 37, 168)';

  static const String LIGHT_PURPLE = 'rgb(200, 140, 255)';
  static const String PURPLE       = 'rgb(128, 0, 255)';
  static const String DARK_PURPLE  = 'rgb(64, 0, 128)';

  static const String LIGHT_BROWN  = 'rgb190, 150, 100';
  static const String BROWN        = 'rgb160, 110, 60';
  static const String DARK_BROWN   = 'rgb100, 64, 32';
  final String cccol;
  Color(this.cccol);
}


/// Unicode code points for various special characters that also exist on
/// [code page 437][font].
///
/// [font]: http://en.wikipedia.org/wiki/Code_page_437
// Note: If you add stuff to this, make sure to add an appropriate mapping in
// canvas_terminal.dart.
class CharCode {
  static const SPACE = 0x0020;
  static const ASTERISK = 0x002a;
  static const MIDDLE_DOT = 0x00b7;
  static const BULLET = 0x2022;
  static const BULLET_OPERATOR = 0x2219;
  static const LEFT_RIGHT_ARROW = 0x2194;
  static const UP_DOWN_ARROW = 0x2195;
  static const SOLID = 0x2588;
  static const HALF_LEFT = 0x258c;
  static const BLACK_UP_POINTING_TRIANGLE = 0x25b2;
  static const BLACK_SPADE_SUIT = 0x2660;
  static const BLACK_CLUB_SUIT = 0x2663;
  static const BOX_DRAWINGS_LIGHT_VERTICAL = 0x2502;
  static const TRIPLE_BAR = 0x2261;
  static const PI = 0x03C0;
  static const BLACK_HEART_SUIT = 0x2665;
}


class Char {

  final int char;
  final String textColor;
  final String textBack;
  static const DERP = const Char.fromCharCode(CharCode.SPACE);

  Char(String char, [String textColor, String textBack])
      : char = char.codeUnits[0],
        textColor = textColor != null ? textColor : Color.WHITE,
        textBack = textBack != null ? textBack : Color.BLACK;

  const Char.fromCharCode(this.char, [String textColor, String textBack])
      : textColor = textColor != null ? textColor : Color.WHITE,
        textBack = textBack != null ? textBack : Color.BLACK;

  factory Char.fromDynamic(charOrCharCode, [String textColor, String textBack]) {
    if (charOrCharCode is String) return new Char(charOrCharCode, textColor, textBack);
    return new Char(charOrCharCode, textColor, textBack);
  }

  operator ==(other) {
    if (other is! Char) return false;
    return char == other.char && textColor == other.textColor && textBack == other.textBack;
  }
  int get hashCode => hash2(textColor.hashCode, textBack.hashCode);

}