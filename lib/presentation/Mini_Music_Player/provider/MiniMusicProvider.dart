import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:project/presentation/Home/model/new_songsection.dart';


class AudioPlayerProvider with ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  SongEntity? _currentSong;

  bool get isPlaying => _isPlaying;
  Duration get position => _position;
  Duration get duration => _duration;
  SongEntity? get currentSong => _currentSong;

  AudioPlayer get audioPlayer => _audioPlayer;

  AudioPlayerProvider() {
    _audioPlayer.positionStream.listen((p) {
      _position = p;
      notifyListeners();
    });

    _audioPlayer.durationStream.listen((d) {
      _duration = d ?? Duration.zero;
      notifyListeners();
    });
  }

  Future<void> play(SongEntity song) async {
    if (_currentSong != song) {
      await _audioPlayer.setAsset(song.audio);
    }

    if (!_isPlaying) {
      await _audioPlayer.play();
      _isPlaying = true;
      _currentSong = song;
      notifyListeners();
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

  Future<void> seek(Duration position) async {
    await _audioPlayer.seek(position);
  }
}