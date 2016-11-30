library liquid.ui.levels;

import '../engine.dart';

class SelectLevelScreen extends Screen<Input> {
  final Content content;
  final Storage storage;

  SelectLevelScreen(this.content, this.storage);

  bool handleInput(Input input) {
    switch (input) {
      case Input.cancel:
        ui.pop();
        return true;

    }
    return false;
  }

  void render(NormalTerminal terminal) {
  }

}