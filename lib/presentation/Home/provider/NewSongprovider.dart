import 'package:flutter/material.dart';
import 'package:project/presentation/Home/model/new_songsection.dart';

class Newsongprovider with ChangeNotifier {
  final List<NewSongsection> newsong = [];
  List<NewSongsection> get newSongs => newsong;

  void addSongs(String name, String imageUrl, String tittle) {
    newSongs.add(
      NewSongsection(name: name, imagUrl: imageUrl, tittle: tittle),
    );
    notifyListeners();
  }
}
