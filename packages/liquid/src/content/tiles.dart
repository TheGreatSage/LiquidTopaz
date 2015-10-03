library liquid.content.tiles;

class Tiles {

  static TileType floor;
  static TileType wall;

  static void initialize() {
    // Define the tile types.
    Tiles.floor = new TileType("floor", true, true, [gray('.'), darkGray('.')]);

    Tiles.wall = new TileType("wall", false, false, [lightGray('#', Color.DARK_GRAY), darkGray('#')]);

  }


}