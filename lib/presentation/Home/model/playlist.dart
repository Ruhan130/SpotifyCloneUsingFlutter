import 'package:project/core/config/assets/app_image.dart';
import 'package:project/core/config/assets/app_music.dart';

class Playlist {
  final String name;
  final String title;
  final String image;
  final String audio;
  final String duraTion;

  Playlist(
      {required this.name,
      required this.title,
      required this.image,
      required this.audio,
      required this.duraTion});

       factory Playlist.fromMap(Map<String, dynamic> map) {
    return Playlist(
      name: map['name'] ?? '',
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      audio: map['audio'] ?? '',
      duraTion: map['duration'] ?? '',
    );
  }
}
final List<Playlist> playList = [
  Playlist(
      name: "Dusk Till Dawn",
      title: "Zayn Malik",
      image: AppImage.bili_eilish2,
      audio: AppMusic.lovely_by_billi, duraTion: '4:51' ),
  Playlist(
      name: "No Lie",
      title: "Sean Paul",
      image: AppImage.Drake1,
      audio: AppMusic.one_dance_drake,  duraTion: '4:10'),
  Playlist(
      name: "Dont, Let me down",
      title: "The chainsmokers",
      image: AppImage.ed_sheeran,
      audio: AppMusic.perfect_ed_sheeran, duraTion: '4:23'),
  Playlist(
      name: "Falling",
      title: "Trevor Daniel",
      image: AppImage.lana_del_rey1,
      audio: AppMusic.say_yes_to_heaven_LANADELRAy,  duraTion: '3:27'),
];

