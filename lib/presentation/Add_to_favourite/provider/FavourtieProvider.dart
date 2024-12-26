import 'package:flutter/material.dart';
import 'package:project/presentation/Home/model/new_songsection.dart';
import 'package:provider/provider.dart';

class Favourtieprovider extends ChangeNotifier{
  final List<SongEntity> _favourite = []; 
  void toggleFavourite(SongEntity song){
    if(_favourite.contains(song)){
      _favourite.remove(song);
    }
    else{
      _favourite.add(song);
    }
    notifyListeners();
  }
  bool isExit(SongEntity song){
    final isExit = _favourite.contains(song);
    return isExit;
  }


  static Favourtieprovider of(BuildContext context, {bool listen = true}){
    return Provider.of<Favourtieprovider>(context, listen:  listen);
  }
}