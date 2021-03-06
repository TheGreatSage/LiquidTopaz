library liquid.testing.main2;

import 'dart:html' as htm;
import 'tester.dart';
import '../lib/src/engine.dart';

final terminals = [];
UserInterface<Input> ui;

addTerminal(String name, htm.Element element, Terminal herpp(htm.Element element)) {

  // Make the terminal.
  var terminal = herpp(element);
  terminals.add([name, element, terminal]);



  // Make a button for it.
  var button = new htm.ButtonElement();
  button.innerHtml = name;
  button.onClick.listen((_) {
    for (var i = 0; i < terminals.length; i++) {
      if (terminals[i][0] == name) {
        htm.querySelector("#game").append(terminals[i][1]);
      } else {
        terminals[i][1].remove();
      }
    }
    ui.setTerminal(terminal);

    // Remember the preference.

    htm.window.localStorage['font'] = name;
  });

  htm.querySelector('.button-bar').children.add(button);
}

main() {
  var content = createContent();

  addTerminal('Arial', new htm.CanvasElement(), (element) =>     new NormalTerminal(100, 40,  new Font('Arial',    size: 12, w:9, h:13, x:1, y:10), element));
  addTerminal('Helvetica', new htm.CanvasElement(), (element) => new NormalTerminal(100, 40,  new Font('Helvetica',size: 12, w:9, h:13, x:1, y:10), element));
  addTerminal('Courier', new htm.CanvasElement(), (element) => new NormalTerminal(100, 40,new Font('Courier New',  size: 12, w:9, h:13, x:1, y:10), element));
  addTerminal('Gotham', new htm.CanvasElement(), (element) =>    new NormalTerminal(100, 40,  new Font('Gotham',   size: 12, w:9, h:13, x:1, y:10), element));

  var font = htm.window.localStorage['font'];
  var fontIndex = 3;
  for (var i = 0; i < terminals.length; i++) {
    if (terminals[i][0] == font) {
      fontIndex = i;
      break;
    }
  }

  htm.querySelector("#game").append(terminals[fontIndex][1]);
  ui = new UserInterface<Input>(terminals[fontIndex][2]);

  // Set up the keyPress.
  ui.keyPress.bind(Input.ok, KeyCode.enter);
  ui.keyPress.bind(Input.cancel, KeyCode.escape);
  ui.keyPress.bind(Input.forfeit, KeyCode.f, shift: true);
  ui.keyPress.bind(Input.quit, KeyCode.q);

  ui.keyPress.bind(Input.closeDoor, KeyCode.c);
  ui.keyPress.bind(Input.drop, KeyCode.d);
  ui.keyPress.bind(Input.use, KeyCode.u);
  ui.keyPress.bind(Input.pickUp, KeyCode.g);
  ui.keyPress.bind(Input.swap, KeyCode.x);
  ui.keyPress.bind(Input.toss, KeyCode.t);
  ui.keyPress.bind(Input.selectCommand, KeyCode.s);

  // Laptop directions.
  ui.keyPress.bind(Input.nw, KeyCode.i);
  ui.keyPress.bind(Input.n, KeyCode.o);
  ui.keyPress.bind(Input.ne, KeyCode.p);
  ui.keyPress.bind(Input.w, KeyCode.k);
  ui.keyPress.bind(Input.e, KeyCode.semicolon);
  ui.keyPress.bind(Input.sw, KeyCode.comma);
  ui.keyPress.bind(Input.s, KeyCode.period);
  ui.keyPress.bind(Input.se, KeyCode.slash);
  ui.keyPress.bind(Input.runNW, KeyCode.i, shift: true);
  ui.keyPress.bind(Input.runN, KeyCode.o, shift: true);
  ui.keyPress.bind(Input.runNE, KeyCode.p, shift: true);
  ui.keyPress.bind(Input.runW, KeyCode.k, shift: true);
  ui.keyPress.bind(Input.runE, KeyCode.semicolon, shift: true);
  ui.keyPress.bind(Input.runSW, KeyCode.comma, shift: true);
  ui.keyPress.bind(Input.runS, KeyCode.period, shift: true);
  ui.keyPress.bind(Input.runSE, KeyCode.slash, shift: true);
  ui.keyPress.bind(Input.fireNW, KeyCode.i, alt: true);
  ui.keyPress.bind(Input.fireN, KeyCode.o, alt: true);
  ui.keyPress.bind(Input.fireNE, KeyCode.p, alt: true);
  ui.keyPress.bind(Input.fireW, KeyCode.k, alt: true);
  ui.keyPress.bind(Input.fireE, KeyCode.semicolon, alt: true);
  ui.keyPress.bind(Input.fireSW, KeyCode.comma, alt: true);
  ui.keyPress.bind(Input.fireS, KeyCode.period, alt: true);
  ui.keyPress.bind(Input.fireSE, KeyCode.slash, alt: true);

  ui.keyPress.bind(Input.ok, KeyCode.l);
  ui.keyPress.bind(Input.rest, KeyCode.l, shift: true);
  ui.keyPress.bind(Input.fire, KeyCode.l, alt: true);

  // Arrow keys.
  ui.keyPress.bind(Input.n, KeyCode.up);
  ui.keyPress.bind(Input.w, KeyCode.left);
  ui.keyPress.bind(Input.e, KeyCode.right);
  ui.keyPress.bind(Input.s, KeyCode.down);
  ui.keyPress.bind(Input.runN, KeyCode.up, shift: true);
  ui.keyPress.bind(Input.runW, KeyCode.left, shift: true);
  ui.keyPress.bind(Input.runE, KeyCode.right, shift: true);
  ui.keyPress.bind(Input.runS, KeyCode.down, shift: true);
  ui.keyPress.bind(Input.fireN, KeyCode.up, alt: true);
  ui.keyPress.bind(Input.fireW, KeyCode.left, alt: true);
  ui.keyPress.bind(Input.fireE, KeyCode.right, alt: true);
  ui.keyPress.bind(Input.fireS, KeyCode.down, alt: true);

  // Numeric keypad.
  ui.keyPress.bind(Input.nw, KeyCode.numpad7);
  ui.keyPress.bind(Input.n, KeyCode.numpad8);
  ui.keyPress.bind(Input.ne, KeyCode.numpad9);
  ui.keyPress.bind(Input.w, KeyCode.numpad4);
  ui.keyPress.bind(Input.e, KeyCode.numpad6);
  ui.keyPress.bind(Input.sw, KeyCode.numpad1);
  ui.keyPress.bind(Input.s, KeyCode.numpad2);
  ui.keyPress.bind(Input.se, KeyCode.numpad3);
  ui.keyPress.bind(Input.runNW, KeyCode.numpad7, shift: true);
  ui.keyPress.bind(Input.runN, KeyCode.numpad8, shift: true);
  ui.keyPress.bind(Input.runNE, KeyCode.numpad9, shift: true);
  ui.keyPress.bind(Input.runW, KeyCode.numpad4, shift: true);
  ui.keyPress.bind(Input.runE, KeyCode.numpad6, shift: true);
  ui.keyPress.bind(Input.runSW, KeyCode.numpad1, shift: true);
  ui.keyPress.bind(Input.runS, KeyCode.numpad2, shift: true);
  ui.keyPress.bind(Input.runSE, KeyCode.numpad3, shift: true);

  ui.keyPress.bind(Input.ok, KeyCode.numpad5);
  ui.keyPress.bind(Input.rest, KeyCode.numpad5, shift: true);
  ui.keyPress.bind(Input.fire, KeyCode.numpad5, alt: true);

  ui.push(new MainMenuScreen(content));

  ui.handlingInput=true;
  ui.running = true;

}


void debugHover(htm.Element debugBox, Vec pixel, Vec pos) {
  /**
  var info = Debug.getMonsterInfoAt(pos);
  if (info == null) {
    debugBox.style.display = "none";
    return;
  }
   **/

  debugBox.style.display = "inline-block";
  debugBox.style.left = "${pixel.x + 10}";
  debugBox.style.top = "${pixel.y}";
  //debugBox.text = info;
}