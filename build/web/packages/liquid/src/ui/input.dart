library liquid.ui.input;

class Input {

  static const OK = const Input("OK");
  static const SELECT_COMMAND = const Input("SELECT_COMMAND");
  static const UP = const Input("UP");
  static const DOWN = const Input("DOWN");
  static const CANCEL = const Input("CANCEL");


  final String name;
  const Input(this.name);

}