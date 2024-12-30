import 'package:flutter/material.dart';
import 'package:project/common/helper/isDark.dart';
import 'package:project/common/widgets/customTextWiget.dart';
import 'package:project/core/config/assets/app_dimensions.dart';
import 'package:project/core/config/theme/app_color.dart';
import 'package:project/presentation/Add_to_favourite/provider/FavourtieProvider.dart';
import 'package:project/presentation/Home/model/new_songsection.dart';
import 'package:project/presentation/Mini_Music_Player/pages/Mini_Music_Player.dart';
import 'package:project/presentation/song-player/song_player.dart';
import 'package:provider/provider.dart';

class Playlist extends StatefulWidget {
  Playlist({super.key, });

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.padingSemetric15,
            vertical: AppDimensions.padingSemetric20),
        child: Column(
          children: [
            Row(
              children: [
                CustomTextwiget(
                  text: 'Playlist',
                  color: context.isDarkMode
                      ? AppColor.textColorBlack
                      : AppColor.textColorWhite,
                  fontWeight: FontWeight.bold,
                  textFontsize: AppDimensions.fontsize15,
                ),
                const Spacer(),
              ],
            ),
            _playList(songList)
          ],
        ),
      ),
    );
  }

  Widget _playList(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final song = songs[index];
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: AppDimensions.padingTo10),
              child: Container(
                height: AppDimensions.containerHeightInHome,
                width: AppDimensions.containerWidgetInHome,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.isDarkMode
                      ? AppColor.darkGrey
                      : const Color(0xffE6E6E6),
                ),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => MiniMusicPlayer(songEntity: song,)
                    );
                  },
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: context.isDarkMode
                        ? AppColor.textColorWhite
                        : AppColor.textColorBlack,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: AppDimensions.sizeHeight20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SongPlayer(songEntity: song),
                        ));
                  },
                  child: CustomTextwiget(
                    text: song.name, // Playlist name
                    fontWeight: FontWeight.bold,
                    textFontsize: AppDimensions.fontsize15,
                    color: context.isDarkMode
                        ? AppColor.darkGrey
                        : const Color(0xffE6E6E6),
                  ),
                ),
                CustomTextwiget(
                  text: song.title, // Playlist title
                  fontWeight: FontWeight.normal,
                  textFontsize: AppDimensions.fontsize12,
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
                  textFontsize: AppDimensions.fontsize15,
                  color: context.isDarkMode
                      ? AppColor.darkGrey
                      : const Color(0xffE6E6E6),
                ),
                const SizedBox(
                  width: AppDimensions.sizeHeight20,
                ),
                Consumer<Favourtieprovider>(
                  builder: (context, provider, child) {
                    return GestureDetector(
                      onTap: () {
                        provider.toggleFavourite(song);
                      },
                      child: Icon(
                        provider.isExit(song)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: AppColor.darkGrey,
                      ),
                    );
                  },
                )
              ],
            )
          ],
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: AppDimensions.sizeHeight20,
        );
      },
      itemCount: songs.length,
    );
  }
}
