library liquid.bb.display.token;


const MENUCHARSCHARS = const [
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


class Char {

  final int char;
  static const DERP = const Char.fromCharCode(0x0020);

  Char(String char): char = char.codeUnits[0];

  const Char.fromCharCode(this.char);
}


class Color {
  final String cccol;
  static String BLACK   = '#000';
  static String WHITE        = '#ffffff';

  static String LIGHT_GRAY   = 'rgb(192, 192, 192)';
  static String GRAY         = 'rgb(128, 128, 128';
  static String DARK_GRAY    = 'rgb(64, 64, 64)';

  static String LIGHT_RED    = 'rgb(255, 160, 160)';
  static String RED          = 'rgb(220, 0, 0)';
  static String DARK_RED     = 'rgb(100, 0, 0)';

  static String LIGHT_ORANGE = 'rgb(255, 200, 170)';
  static String ORANGE       = 'rgb(255, 128, 0)';
  static String DARK_ORANGE  = 'rgb(128, 64, 0)';

  static String LIGHT_GOLD   = 'rgb(255, 230, 150)';
  static String GOLD         = 'rgb(255, 192, 0)';
  static String DARK_GOLD    = 'rgb(128, 96, 0)';

  static String LIGHT_YELLOW = 'rgb(255, 255, 150)';
  static String YELLOW       = 'rgb(255, 255, 0)';
  static String DARK_YELLOW  = 'rgb(128, 128, 0)';

  static String LIGHT_GREEN  = 'rgb(130, 255, 90)';
  static String GREEN        = 'rgb(0, 128, 0)';
  static String DARK_GREEN   = 'rgb(0, 64, 0)';

  static String LIGHT_AQUA   = 'rgb(128, 255, 255)';
  static String AQUA         = 'rgb(0, 255, 255)';
  static String DARK_AQUA    = 'rgb(0, 128, 128)';

  static String LIGHT_BLUE   = 'rgb(128, 160, 255)';
  static String BLUE         = 'rgb(0, 64, 255)';
  static String DARK_BLUE    = 'rgb(0, 37, 168)';

  static String LIGHT_PURPLE = 'rgb(200, 140, 255)';
  static String PURPLE       = 'rgb(128, 0, 255)';
  static String DARK_PURPLE  = 'rgb(64, 0, 128)';

  static String LIGHT_BROWN  = 'rgb190, 150, 100';
  static String BROWN        = 'rgb160, 110, 60';
  static String DARK_BROWN   = 'rgb100, 64, 32';

  Color(this.cccol);
}