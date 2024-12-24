import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:project/presentation/song-player/bloc/song_player_state.dart';

class SongPlayerCubmit extends Cubit<SongPlayerState>{
  SongPlayerCubmit() : super (SongPlayerLoading());

  AudioPlayer audioPlayer = AudioPlayer();
    

}