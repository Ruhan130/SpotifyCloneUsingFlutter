import 'package:flutter/material.dart';
import 'package:project/common/helper/isDark.dart';
import 'package:project/common/widgets/customTextWiget.dart';
import 'package:project/core/config/theme/app_color.dart';
import 'package:project/presentation/Home/model/new_songsection.dart';
import 'package:project/presentation/Home/model/playlist.dart';
import 'package:project/presentation/song-player/song_player.dart';
class Playlist extends StatelessWidget {
  
  Playlist({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              CustomTextwiget(
                text: 'Playlist',
                color: context.isDarkMode ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
                textFontsize: 15,
              ),
              const Spacer(),
              CustomTextwiget(
                text: 'See more',
                color: context.isDarkMode ? Colors.black : Colors.white,
                fontWeight: FontWeight.w500,
                textFontsize: 12,
              ),
            
            ],
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height ,child: _playList(songList))
        ],
      ),
    );
  }

  Widget _playList(List<SongEntity> songs) {
  return ListView.separated(
    scrollDirection: Axis.vertical,
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (context, index) {
      final song = songs[index]; // Fetching Playlist object
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.isDarkMode
                    ? AppColor.darkGrey
                    : const Color(0xffE6E6E6),
              ),
              child: GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SongPlayer(songEntity: song),));},
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: context.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextwiget(
                text: song.name, // Playlist name
                fontWeight: FontWeight.bold,
                textFontsize: 15,
                color: context.isDarkMode
                    ? AppColor.darkGrey
                    : const Color(0xffE6E6E6),
              ),
              CustomTextwiget(
                text: song.title, // Playlist title
                fontWeight: FontWeight.normal,
                textFontsize: 12,
                color: context.isDarkMode
                    ? AppColor.darkGrey
                    : const Color(0xffE6E6E6),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              CustomTextwiget(
                text: song.duraTion, // Duration from Playlist
                textFontsize: 15,
                color: context.isDarkMode
                    ? AppColor.darkGrey
                    : const Color(0xffE6E6E6),
              ),
              IconButton(
                onPressed: () {
                  // Handle favorite action
                },
                icon: const Icon(
                  Icons.favorite_rounded,
                  color: AppColor.darkGrey,
                ),
              )
            ],
          )
        ],
      );
    },
    separatorBuilder: (context, index) {
      return const SizedBox(
        height: 20,
      );
    },
    itemCount: songs.length,
  );
}
}
