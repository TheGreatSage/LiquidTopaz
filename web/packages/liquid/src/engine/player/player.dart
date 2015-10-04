library liquid.engine.player.player;

import '../../engine.dart';


class PlayerInfo {
  final String name;
  int level = 1;
  PlayerInfo(this.name);
  PlayerInfo.load(this.name);

}
class Player {
  int _level = 1;


}