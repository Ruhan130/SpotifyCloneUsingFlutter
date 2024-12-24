import 'package:project/core/config/assets/app_image.dart';

class SongEntity {
  final String name;
  final String title;
  final String image;

  SongEntity({
    required this.name,
    required this.title,
    required this.image,
  });

  // Factory method for creating instances from a map
  factory SongEntity.fromMap(Map<String, dynamic> map) {
    return SongEntity(
      name: map['name'] ?? '',
      title: map['title'] ?? '',
      image: map['image'] ?? '',
    );
  }
}

// Example data
final List<SongEntity> songList = [
  SongEntity(name: "Lovely", title: "Billie Eilish", image: AppImage.bili_eilish2),
  SongEntity(name: "One Dance", title: "Drake", image: AppImage.Drake1),
  SongEntity(name: "Perfect", title: "Ed Sheeran", image: AppImage.ed_sheeran),
  SongEntity(name: "To Heaven", title: "Lana Del Rey", image: AppImage.lana_del_rey1),
];
