library liquid.content.tiles;
import '../engine.dart';
class Tiles {

  static TileType floor;
  static TileType wall;

  static void initialize() {
    // Define the tile types.
    Tiles.floor = new TileType("floor", true, true, [gray('.'), darkGray('.')]);
    Tiles.wall = new TileType("wall", false, false, [lightGray('#', Color.DARK_GRAY), darkGray('#')]);

  }


}

class TileType {
  final String name;
  final bool isPassable;
  final bool isTransparent;
  final apperance;
  TileType opensTo;
  TileType closesTo;
  TileType(this.name, this.isPassable, this.isTransparent, this.apperance);
}