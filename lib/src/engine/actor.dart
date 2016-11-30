library liquid.engine.actor;

import '../engine.dart';
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

class Actor implements Thing {
  Vec _pos;
  final Stat health;


  Actor(this._pos, int health): health = new Stat(health);

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

  void changePosition(Vec from, Vec to) {
    to == from;
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}


class Stat {
  int _current;
  int _max;

  int get current => _current;
  void set current(int value) {
    _current = value.clamp(0, _max);
  }

  int get max => _max;
  void set max(int value) {
    _max = value;

    // Make sure current is still in bounds.
    _current = _current.clamp(0, _max);
  }

  bool get isMax => _current == _max;

  Stat(int value)
      : _current = value,
        _max = value;
}
