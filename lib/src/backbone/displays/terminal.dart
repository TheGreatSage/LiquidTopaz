library liquid.bb.display.terminal;

import 'dart:html' as htm;
import 'token.dart';
abstract class Terminal {
  int get width;
  int get height;

  void clear() {
    for (var y = 0; y < height; y++) {
      for (var x = 0; x < width; x++) {
        drawToken(x, y, Char.DERP);
      }
    }
  }

  void render();


  void drawToken(int x, int y, Char chars);


}

class Font {
  final String family;
  final int size;
  final int charWidth;
  final int charHeight;

  Font(this.family, {this.size, int w, int h}) : charWidth = w, charHeight = h;

}


class derp extends Terminal {
  final Font _font;
  final htm.CanvasElement _canvas;
  htm.CanvasRenderingContext2D _contex;

  void render() {
    _contex.font = '${_font.size}px ${_font.family}, monospace';
    _contex.fillStyle = Color.BLACK;
    _contex.fillRect(0,0,_canvas.width,_canvas.height);


    for (var y = 0; y < MENUCHARSCHARS.length; y++) {
      for (var x = 0; x < MENUCHARSCHARS[y].length; x++) {
        _contex.fillStyle = Color.RED;
        _contex.fillText(MENUCHARSCHARS[y][x],x*_font.charWidth+4,y*_font.charHeight+21);
      }
    }



  }

  /**
   * Create A new Canvas
   *
   */
  derp(int width, int height, this._canvas, this._font) {
    _contex = _canvas.context2D;
    _canvas.width = width * _font.charWidth;
    _canvas.height = height * _font.charHeight;
    _canvas.style.width = '${_canvas.width}px';
    _canvas.style.height ='${_canvas.height}px';
  }
}