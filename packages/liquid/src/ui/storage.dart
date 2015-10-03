library liquid.ui.storage;

import 'dart:convert';
import 'dart:html' as html;

import '../engine.dart';

class Storage {
  final Content content;
  //final List<HeroSave> heroes = <HeroSave>[];

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
  }
  void save() {
    var heroData = [];
    var data = {
      'heroes': heroData
    };
    html.window.localStorage['heroes'] = JSON.encode(data);
    print('Saved.');

  }
}