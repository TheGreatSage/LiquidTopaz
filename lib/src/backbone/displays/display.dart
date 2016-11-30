library liquid.bb.displays.display;

import '../backbone.dart';


import 'token.dart';

typedef void RenderToken(int x, int y, Char chars);

/// The "backing store" that a renderable terminal uses to tell which glyphs
/// actually need rendering.
///
/// Drawing a glyph on screen is the most expensive operation a terminal
/// performs, so we want to avoid doing that when not necessary. The simplest
/// solution is to render the glyphs that are drawn when terminal draw call is
/// made. However, it's common for a given terminal cell to be drawn multiple
/// times between updates. Often, the final result is the same as what was
/// previously on screen.
///
/// For example, consider a terminal for a game. It renders a "." floor tile,
/// then renders the "/" on top of that for an item on the floor, then a "M"
/// for the monster standing on that tile. The end user only sees the "M". The
/// next frame, the process repeats and the ".", "/", and "M" are drawn.
///
/// If we render eagerly, that's a ton of wasted effort to end up with the same
/// pixels that are on screen. What we want is to let the code modify as many
/// glyphs as it wants as many times as it wants. Once that entire draw process
/// is complete, we see which glyphs ended up different from the last time the
/// terminal was shown to the user and just render those.
///
/// That's what this class does. It maintains two arrays of glyphs. One
/// represents what was last shown to the user. The other represents what
/// modifications have been made to the terminal since then. When the terminal
/// is written to, this keeps track of which glyphs are actually different from
/// the last render and which are the same.
///
/// Once that's done, you can call [render]. That will invoke the callback to
/// actually draw a glyph, but only for the ones that are actually modified.
class Display {
  /// The current display state. The glyphs here mirror what has been rendered.
  final Array2D<Char> _tokens;

  /// The glyphs that have been modified since the last call to [render].
  final Array2D<Char> _changedTokens;

  int get width => _tokens.width;
  int get height => _tokens.height;
  Vec get size => _tokens.size;

  Display(int width, int height)
      : _tokens = new Array2D<Char>(width, height),
        _changedTokens = new Array2D<Char>(width, height, Char.DERP);

  /// Sets the cell at [x], [y], to [glyph].
  void setToken(int x, int y, Char char) {
    if (x < 0) return;
    if (x >= width) return;
    if (y < 0) return;
    if (y >= height) return;

    if (_tokens.get(x, y) != char) {
      _changedTokens.set(x, y, char);
    } else {
      _changedTokens.set(x, y, null);
    }
  }

  /// Calls [renderGlyph] for every glyph that has changed since the last call
  /// to [render].
  void render(RenderToken renderChar) {
    for (var y = 0; y < height; y++) {
      for (var x = 0; x < width; x++) {
        var char = _changedTokens.get(x, y);

        // Only draw glyphs that are different since the last call.
        if (char == null) continue;

        renderChar(x, y, char);

        // It's up to date now.
        _tokens.set(x, y, char);
        _changedTokens.set(x, y, null);
      }
    }
  }
}