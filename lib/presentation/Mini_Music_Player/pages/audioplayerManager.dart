import 'package:just_audio/just_audio.dart';

class AudioPlayerManager {
  static final AudioPlayer _audioPlayer = AudioPlayer();

  static AudioPlayer get instance => _audioPlayer;
}
