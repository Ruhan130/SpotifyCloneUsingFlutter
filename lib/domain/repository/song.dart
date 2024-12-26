import 'package:dartz/dartz.dart';
import 'package:project/presentation/Home/model/new_songsection.dart';

abstract class SongsRepository {
  Future<Either> addOrRemoveFavouriteSongs(SongEntity songlist); 
}