library liquid.engine.game;

import 'dart:collection';

import '../engine.dart';
import 'area.dart';



class Game {
  final Area area;
  final int level;

  Game(this.area, this.level);


}

abstract class Content {

  PlayerInfo createHero(String name);

}