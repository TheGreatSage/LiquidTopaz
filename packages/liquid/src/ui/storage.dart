library liquid.ui.storage;

import 'dart:convert';
import 'dart:html' as html;

import '../engine.dart';

class Storage {
  final Content content;
  final List<PlayerInfo> heroes = <PlayerInfo>[];

  Storage(this.content) {
    _load();
  }

  void _load() {

    if (html.window.location.search == '?clear') {
      save();
      return;
    }



    var storage = html.window.localStorage['heroes'];
    if (storage == null) return;

    var data = JSON.decode(storage);

    for (final hero in data['heroes']) {
      var name = hero['name'];
      var heroSave = new PlayerInfo.load(name);
      heroes.add(heroSave);
    }

  }
  void save() {
    var heroData = [];
    for (var hero in heroes) {
      heroData.add({'name': hero.name});
    }

    var data = {
      'heroes': heroData
    };
    html.window.localStorage['heroes'] = JSON.encode(data);
    print('Saved.');

  }
}