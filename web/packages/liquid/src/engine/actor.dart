library liquid.engine.actor;

import 'package:piecemeal/piecemeal.dart';
import 'game.dart';
import 'log.dart';

abstract class Thing implements Noun {
  Vec _pos;

  Thing(this._pos);

  Vec get pos => _pos;
  void set pos(Vec value) {
    if (value != _pos) {
      changePosition(_pos, value);
      _pos = value;
    }
  }

  int get x => pos.x;
  void set x(int value) {
    pos = new Vec(value, y);
  }

  int get y => pos.y;
  void set y(int value) {
    pos = new Vec(x, value);
  }

  /// Called when the actor's position is about to change from [from] to [to].
  void changePosition(Vec from, Vec to) {}

  get appearance;
  String get nounText;
  Pronoun get pronoun => Pronoun.IT;

  String toString() => nounText;
}