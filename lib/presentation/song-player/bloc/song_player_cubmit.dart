import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import 'package:project/presentation/Home/model/new_songsection.dart';
import 'package:project/presentation/song-player/bloc/song_player_state.dart';

class SongPlayerCubmit extends Cubit<SongPlayerState> {
  final SongEntity songEntity;
  AudioPlayer audioPlayer = AudioPlayer();

  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;


  SongPlayerCubmit(this.songEntity) : super(SongPlayerLoading()){
    audioPlayer.durationStream.listen((position){
      songPosition = position!;
      updateSongPlayer();
    });

    audioPlayer.durationStream.listen((duration){
      songDuration = duration!;
    });
  }
  void updateSongPlayer(){
    emit(
      SongPlayerLoaded()
    );
  }

  Future<void> loadSong(List<SongEntity> songs) async {
    try {
      await audioPlayer.setAsset(songEntity.audio);
      emit(SongPlayerLoaded());
    } catch (e) {
      emit(SongPlayerLoaded());
    }
  }

  void PlayorPause() {
    if (audioPlayer.playing) {
      audioPlayer.stop();
    } else {
      audioPlayer.play();
    }
    emit(SongPlayerLoaded());
  }

  @override
  Future <void> close(){
    audioPlayer.dispose();
    return super.close();
  }
}
