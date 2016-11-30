library liquid.bb.display.terminal;


import 'dart:html' as htm;
import 'token.dart';
import 'display.dart';
import '../backbone.dart';

abstract class Terminal {
  int get width;
  int get height;
  Vec get size;

  void clear() {
    for (var y = 0; y < height; y++) {
      for (var x = 0; x < width; x++) {
        drawToken(x, y, Char.DERP);
      }
    }
  }


  void writeAt(int x, int y, String text, [String fore, String back]) {
    if (fore == null) fore = Color.WHITE;
    if (back == null) back = Color.BLACK;
    for (var i = 0; i < text.length; i++) {
      if (x + i >= width) break;
      drawToken(x + i, y, new Char.fromCharCode(text.codeUnitAt(i), fore, back));
    }
  }

  /// Writes a one-character string consisting of [charCode] at column [x],
  /// row [y] using [fore] as the text color and [back] as the background color.
  void drawChar(int x, int y, int charCode, [String fore, String back]) {
    drawToken(x, y, new Char.fromCharCode(charCode, fore, back));
  }

  void drawToken(int x, int y, Char chars);

  void render();
  Vec pixelToChar(Vec pixel);




}

class Font {
  final String family;
  final int size;
  final int charWidth;
  final int charHeight;
  final int x;
  final int y;

  Font(this.family, {this.size, int w, int h, this.x, this.y}) : charWidth = w, charHeight = h;

}


class NormalTerminal extends Terminal {

  final Display _display;

  final Font _font;
  final htm.CanvasElement _canvas;
  final htm.CanvasRenderingContext2D _contex;

  /// The drawing scale, used to adapt to Retina displays.
  final int _scale = htm.window.devicePixelRatio.toInt();

  Vec get size => _display.size;
  int get width => _display.width;
  int get height => _display.height;

  factory NormalTerminal(int width, int height, Font font, [htm.CanvasElement canvas]) {
    var display = new Display(width, height);

    // If not given a canvas, create one and add it to the page.
    if (canvas == null) {
      canvas = new htm.CanvasElement();
      htm.document.body.append(canvas);
    }

    return new NormalTerminal._(display, font, canvas);
  }
  /**
   * Create A new Canvas
   *
   */
  NormalTerminal._(this._display, this._font, htm.CanvasElement canvas): _canvas=canvas, _contex = canvas.context2D {
    _canvas.width = (_display.width * _font.charWidth)*_scale;
    _canvas.height = (_display.height * _font.charHeight)*_scale;
    _canvas.style.width = '${_display.width * _font.charWidth}px';
    _canvas.style.height = '${_display.height * _font.charHeight}px';

  }

  void clear() {
    for (var y = 0; y < height; y++) {
      for (var x = 0; x < width; x++) {
        drawToken(x, y, Char.DERP);
      }
    }
  }

  void drawToken(int x, int y, Char chars) {
    _display.setToken(x, y, chars);
  }

  void render() {
    _contex.font = '${_font.size * _scale}px ${_font.family}, monospace';
    //_contex.fillStyle = Color.BLACK;
    //_contex.fillRect(0,0,_canvas.width,_canvas.height);

    _display.render((x, y, chars) {
      var token = chars.char;

      // Fill the background.
      _contex.fillStyle = chars.textBack;
      _contex.fillRect(x * _font.charWidth * _scale, y * _font.charHeight * _scale, _font.charWidth * _scale, _font.charHeight * _scale);

      // Don't bother drawing empty characters.
      if (token == 0 || token == CharCode.SPACE) return;

      _contex.fillStyle = chars.textColor;
      _contex.fillText(new String.fromCharCodes([token]), (x * _font.charWidth + _font.x) * _scale, (y * _font.charHeight + _font.y) * _scale);


    });

  }
  Vec pixelToChar(Vec pixel) =>
      new Vec(pixel.x ~/ _font.charWidth, pixel.y ~/ _font.charHeight);


}