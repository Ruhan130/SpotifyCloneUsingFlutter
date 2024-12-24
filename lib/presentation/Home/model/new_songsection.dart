import 'package:project/core/config/assets/app_image.dart';
import 'package:project/core/config/assets/app_music.dart';

class SongEntity {
  final String name;
  final String title;
  final String image;
  final String audio;

  SongEntity({
    required this.name,
    required this.title,
    required this.image,
    required this.audio,
  });

  // Factory method for creating instances from a map
  factory SongEntity.fromMap(Map<String, dynamic> map) {
    return SongEntity(
      name: map['name'] ?? '',
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      audio: map['audio'] ?? '',
    );
  }
}

// Example data
final List<SongEntity> songList = [
  SongEntity(
      name: "Lovely",
      title: "Billie Eilish",
      image: AppImage.bili_eilish2,
      audio: AppMusic.lovely_by_billi),
  SongEntity(
      name: "One Dance",
      title: "Drake",
      image: AppImage.Drake1,
      audio: AppMusic.one_dance_drake),
  SongEntity(
      name: "Perfect",
      title: "Ed Sheeran",
      image: AppImage.ed_sheeran,
      audio: AppMusic.perfect_ed_sheeran),
  SongEntity(
      name: "To Heaven",
      title: "Lana Del Rey",
      image: AppImage.lana_del_rey1,
      audio: AppMusic.say_yes_to_heaven_LANADELRAy),
];
