library liquid.web.main;

import 'dart:html' as html;


import 'package:liquid/src/engine.dart';


const WIDTH = 100;
const HEIGHT = 40;

final terminals = [];
var ui;

addTerminal(String name, html.Element element, RenderableTerminal terminalCallback(html.Element element)) {

  // Make the terminal.
  var terminal = terminalCallback(element);
  terminals.add([name, element, terminal]);


  // Make a button for it.
  var button = new html.ButtonElement();
  button.innerHtml = name;
  button.onClick.listen((_) {
    for (var i = 0; i < terminals.length; i++) {
      if (terminals[i][0] == name) {
        html.querySelector("#game").append(terminals[i][1]);
      } else {
        terminals[i][1].remove();
      }
    }
    ui.setTerminal(terminal);

    // Remember the preference.

    html.window.localStorage['font'] = name;
  });

  html.querySelector('.button-bar').children.add(button);
}


main() {
  var content = createContent();

  addTerminal('Arial', new html.CanvasElement(),
      (element) => new CanvasTerminal(WIDTH, HEIGHT, element,
  new Font('Arial', size: 6, w: 9, h: 13, x: 1, y: 21)));

  addTerminal('Helvetica', new html.CanvasElement(),
      (element) => new CanvasTerminal(WIDTH, HEIGHT, element,
  new Font('Helvetica', size: 24, w: 9, h: 13, x: 1, y: 21)));

  addTerminal('Clearview', new html.CanvasElement(),
      (element) => new CanvasTerminal(WIDTH, HEIGHT, element,
  new Font('Clearview', size: 36, w: 9, h: 13, x: 1, y: 21)));

  addTerminal('Gotham', new html.CanvasElement(),
      (element) => new CanvasTerminal(WIDTH, HEIGHT, element,
  new Font('Gotham', size: 48, w: 9, h: 13, x: 1, y: 21)));

  // Load the user's font preference, if any.
  var font = html.window.localStorage['font'];
  var fontIndex = 3;
  for (var i = 0; i < terminals.length; i++) {
    if (terminals[i][0] == font) {
      fontIndex = i;
      break;
    }
  }

  html.querySelector("#game").append(terminals[fontIndex][1]);

  ui = new UserInterface(terminals[fontIndex][2]);

  ui.keyBindings.bind(Input.OK, KeyCode.ENTER);
  ui.keyBindings.bind(Input.CANCEL, KeyCode.ESCAPE);
  ui.keyBindings.bind(Input.UP, KeyCode.W);
  ui.keyBindings.bind(Input.DOWN, KeyCode.S);

  ui.push(new MainMenuScreen(content));


  tick(time) {
    ui.refresh();
    html.window.requestAnimationFrame(tick);
  }

  html.window.requestAnimationFrame(tick);
}