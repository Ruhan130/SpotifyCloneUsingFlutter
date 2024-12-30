import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:project/common/helper/isDark.dart';
import 'package:project/common/widgets/customTextWiget.dart';
import 'package:project/core/config/assets/app_dimensions.dart';
import 'package:project/core/config/theme/app_color.dart';
import 'package:project/presentation/Add_to_favourite/provider/FavourtieProvider.dart';
import 'package:project/presentation/Home/model/new_songsection.dart';
import 'package:provider/provider.dart';

class MiniMusicPlayer extends StatefulWidget {
  final SongEntity songEntity;

  const MiniMusicPlayer({super.key, required this.songEntity});

  @override
  State<MiniMusicPlayer> createState() => _MiniMusicPlayerState();
}

class _MiniMusicPlayerState extends State<MiniMusicPlayer> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  void handlePlayPause() {
    if (audioPlayer.playing) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
  }

  void handleSeek(double value) {
    audioPlayer.seek(Duration(seconds: value.toInt()));
  }

  @override
  void initState() {
    super.initState();
    audioPlayer.setAsset(widget.songEntity.audio);

    // Listen to the position stream to update the current position
    audioPlayer.positionStream.listen((p) {
      setState(() {
        position = p; // Update the position
      });
    });

    // Listen to the duration stream to update the total duration
    audioPlayer.durationStream.listen((d) {
      setState(() {
        duration = d!; // Update the duration
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _songs(context, songList),
                const SizedBox(
                  width: AppDimensions.sizeWidget15,
                ),
                _songDetail(context, songList)
              ],
            ),
            _songPlayer(context, songList)
          ],
        ),
      ),
    );
  }

  Widget _songs(BuildContext context, List<SongEntity> songs) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.borderR30),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Image.asset(widget.songEntity.image),
      ),
    );
  }

  Widget _songDetail(BuildContext context, List<SongEntity> songs) {
    return Expanded(
      // width: MediaQuery.of(context).size.width, // Full screen width
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Column with song details
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextwiget(
                  text: widget.songEntity.name,
                  color: context.isDarkMode
                      ? AppColor.textColorBlack
                      : AppColor.textColorWhite,
                  fontWeight: FontWeight.bold,
                  textFontsize: AppDimensions.fontsize15,
                ),
                CustomTextwiget(
                  text: widget.songEntity.title,
                  color: context.isDarkMode
                      ? AppColor.textColorBlack
                      : AppColor.textColorWhite,
                  textFontsize: AppDimensions.fontsize10,
                ),
              ],
            ),
          ),
         
          Spacer(), // Dynamically adjust space between widgets
          Container(
            margin: EdgeInsets.only(top: 5),
            height: AppDimensions.containerHeight35,
            width: AppDimensions.containerWidget35,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColor.primary),
            child: IconButton(
              onPressed: handlePlayPause,
              icon: Icon(
                audioPlayer.playing ? Icons.pause : Icons.play_arrow,
                color: context.isDarkMode
                    ? AppColor.textColorBlack
                    : AppColor.textColorWhite,
                size: AppDimensions.fontsize20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _songPlayer(BuildContext context, List<SongEntity> songList) {
    SongEntity currentSong = songList[0];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            formatDuration(position),
          ),
          // Slider for audio position
          Expanded(
            child: Slider(
              activeColor: context.isDarkMode
                  ? AppColor.textColorBlack
                  : AppColor.textColorWhite,
              max: duration.inSeconds.toDouble(),
              min: 0.0,
              value: position.inSeconds.toDouble(),
              onChanged: handleSeek,
            ),
          ),

          Text(currentSong.duraTion),
        ],
      ),
    );
  }
}
