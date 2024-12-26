import 'package:dartz/dartz.dart';
import 'package:project/presentation/Home/model/new_songsection.dart';

abstract class SongFromList {
  Future<Either> addOrRemoveFavouriteSong( SongEntity songlist);
}

class SongFromListImp extends SongFromList {
  @override
  Future<Either> addOrRemoveFavouriteSong(SongEntity songlist) {
   final SongEntity songEntity = songList[0];

    throw UnimplementedError();
  }
}
