library liquid.testing.main2;
import 'dart:html';
import 'tester.dart';
import '../lib/src/backbone/displays/terminal.dart';

final terminals = [];
var ui;

addTerminal(String name, Element element, herp herpp(Element element)) {

  // Make the terminal.
  var terminal = herpp(element);
  terminals.add([name, element, terminal]);


  // Make a button for it.
  var button = new ButtonElement();
  button.innerHtml = name;
  button.onClick.listen((_) {
    for (var i = 0; i < terminals.length; i++) {
      if (terminals[i][0] == name) {
        querySelector("#game").append(terminals[i][1]);
      } else {
        terminals[i][1].remove();
      }
    }
    terminal.render();

    // Remember the preference.

    window.localStorage['font'] = name;
  });

  querySelector('.button-bar').children.add(button);
}

main() {
  addTerminal('Arial', new CanvasElement(), (element) =>     new derp(100, 40, element, new Font('Arial',    size: 13, w:9, h:13)));
  addTerminal('Helvetica', new CanvasElement(), (element) => new derp(100, 40, element, new Font('Helvetica',size: 13, w:9, h:13)));
  addTerminal('Clearview', new CanvasElement(), (element) => new derp(100, 40, element, new Font('Clearview',size: 13, w:9, h:13)));
  addTerminal('Menlo', new CanvasElement(), (element) =>    new derp(100, 40, element, new Font('Menlo',   size: 13, w:9, h:13)));
  var font = window.localStorage['font'];
  var fontIndex = 3;
  for (var i = 0; i < terminals.length; i++) {
    if (terminals[i][0] == font) {
      fontIndex = i;
      break;
    }
  }
  terminals[fontIndex][2].render();
  querySelector("#game").append(terminals[fontIndex][1]);
}



/**
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
    **/

