import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:project/presentation/Home/model/new_songsection.dart';
// import 'song_entity.dart';

class AudioPlayerProvider with ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  SongEntity? _currentSong;

  bool get isPlaying => _isPlaying;
  SongEntity? get currentSong => _currentSong;

  Future<void> play(SongEntity song) async {
    try {
      // Stop current song if playing
      if (_currentSong != null && _isPlaying) {
        await _audioPlayer.stop();
      }

      _currentSong = song;
      await _audioPlayer.setAsset(song.audio); // Load the song asset
      await _audioPlayer.play();
      _isPlaying = true;
      notifyListeners();
    } catch (e) {
      debugPrint("Error playing song: $e");
    }
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    _isPlaying = false;
    _currentSong = null;
    notifyListeners();
  }
}
