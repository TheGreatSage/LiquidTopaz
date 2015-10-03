library liquid.engine.player.player;

import 'package:piecemeal/piecemeal.dart';


class PlayerInfo {
  final String name;
  int level = 1;
  PlayerInfo(this.name);
  PlayerInfo.load(this.name);

}
class Player {
  int _level = 1;


}