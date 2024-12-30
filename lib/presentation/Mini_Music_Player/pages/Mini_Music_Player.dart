import 'package:flutter/material.dart';
import 'package:project/common/helper/isDark.dart';
import 'package:project/common/widgets/customTextWiget.dart';
import 'package:project/core/config/assets/app_dimensions.dart';
import 'package:project/presentation/Home/model/new_songsection.dart';
import 'package:project/presentation/Mini_Music_Player/provider/MiniMusicProvider.dart';
import 'package:provider/provider.dart';

class MiniMusicPlayer extends StatefulWidget {
  final SongEntity songEntity;

  const MiniMusicPlayer({super.key, required this.songEntity});

  @override
  State<MiniMusicPlayer> createState() => _MiniMusicPlayerState();
}

class _MiniMusicPlayerState extends State<MiniMusicPlayer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AudioPlayerProvider>(
      builder: (context, audioProvider, child) {
        return SizedBox(
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _songs(context),

                // IconButton(
                //   icon: Icon(audioProvider.isPlaying ? Icons.pause : Icons.play_arrow),
                //   onPressed: () {
                //     if (audioProvider.isPlaying) {
                //       audioProvider.pause(); // Pause song
                //     } else {
                //       audioProvider.play(widget.songEntity); // Play song
                //     }
                //   },
                // ),
                // Song Duration Slider
                _songPlayer(context, audioProvider),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _songs(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: Image.asset(widget.songEntity.image),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextwiget(
              text: widget.songEntity.title,
              textFontsize: AppDimensions.fontsize15,
              fontWeight: FontWeight.w700,
            ),
            CustomTextwiget(
              text: widget.songEntity.name,
              textFontsize: AppDimensions.fontsize12,
              fontWeight: FontWeight.w500,
            )
          ],
        )
      ],
    );
  }

  Widget _songPlayer(BuildContext context, AudioPlayerProvider audioProvider) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(formatDuration(audioProvider.position)),
          // Slider for audio position
          Expanded(
            child: Slider(
              activeColor: context.isDarkMode ? Colors.black : Colors.white,
              max: audioProvider.duration.inSeconds.toDouble(),
              min: 0.0,
              value: audioProvider.position.inSeconds.toDouble(),
              onChanged: (value) {
                audioProvider.seek(
                  Duration(
                    seconds: value.toInt(),
                  ),
                );
              },
            ),
          ),
          Text(formatDuration(audioProvider.duration)),
        ],
      ),
    );
  }

  String formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }
}
