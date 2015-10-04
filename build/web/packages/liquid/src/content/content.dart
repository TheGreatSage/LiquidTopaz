library liquid.content;

import '../engine.dart';
import 'tiles.dart';

Content createContent() {
    // Todo Fix tiles
    //Tiles.initialize();
    return new GameContent();
}


class GameContent implements Content {
    PlayerInfo createHero(String name) {
        var hero = new PlayerInfo(name);
        return hero;
    }

}