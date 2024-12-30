import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:project/common/helper/isDark.dart';
import 'package:project/common/widgets/customTextWiget.dart';
import 'package:project/core/config/assets/app_dimensions.dart';
import 'package:project/core/config/theme/app_color.dart';
import 'package:project/presentation/Add_to_favourite/provider/FavourtieProvider.dart';
import 'package:project/presentation/Home/model/new_songsection.dart';
import 'package:project/presentation/Mini_Music_Player/pages/Mini_Music_Player.dart';
import 'package:project/presentation/Mini_Music_Player/provider/MiniMusicProvider.dart';
import 'package:project/presentation/song-player/song_player.dart';
import 'package:provider/provider.dart';

class Playlist extends StatefulWidget {
  const Playlist({super.key});

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  final audioPlayer = AudioPlayer();
  SongEntity? currentSong; // To track the current song
  bool isPlaying = false;

  void playSong(SongEntity song) async {
    if (currentSong == song && isPlaying) {
      // Pause the current song
      await audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      // Play the selected song
      await audioPlayer.setAsset(song.audio);
      await audioPlayer.play();
      setState(() {
        currentSong = song;
        isPlaying = true;
      });
    }
  }

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
            SizedBox(
              height: 10,
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
        final isCurrentSongPlaying = currentSong == song && isPlaying;
        return Row(
          children: [
            Consumer<AudioPlayerProvider>(
              builder: (context, audioProvider, child) {
                return GestureDetector(
                  onTap: () {
                    audioProvider
                        .play(song); // Trigger play for the clicked song
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => MiniMusicPlayer(songEntity: song),
                    ).then((_) {
                      audioProvider.stop(); // Stop playback when modal closes
                    });
                  },
                  child: Icon(
                    audioProvider.isPlaying && audioProvider.currentSong == song
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),
                );
              },
            ),
            const SizedBox(width: AppDimensions.sizeHeight20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SongPlayer(songEntity: song),
                      ),
                    );
                  },
                  child: CustomTextwiget(
                    text: song.name,
                    fontWeight: FontWeight.bold,
                    textFontsize: AppDimensions.fontsize15,
                    color: context.isDarkMode
                        ? AppColor.darkGrey
                        : const Color(0xffE6E6E6),
                  ),
                ),
                CustomTextwiget(
                  text: song.title,
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
                  text: song.duraTion,
                  textFontsize: AppDimensions.fontsize15,
                  color: context.isDarkMode
                      ? AppColor.darkGrey
                      : const Color(0xffE6E6E6),
                ),
                const SizedBox(width: AppDimensions.sizeHeight20),
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
                ),
              ],
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: AppDimensions.sizeHeight20);
      },
      itemCount: songs.length,
    );
  }
}
