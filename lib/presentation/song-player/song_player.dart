// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:project/common/helper/isDark.dart';
import 'package:project/common/widgets/Basic_appbar.dart';
import 'package:project/common/widgets/customTextWiget.dart';
import 'package:project/core/config/theme/app_color.dart';
import 'package:project/presentation/Add_to_favourite/provider/FavourtieProvider.dart';
import 'package:project/presentation/Home/model/new_songsection.dart';
import 'package:provider/provider.dart';

class SongPlayer extends StatefulWidget {
  final SongEntity songEntity;
  const SongPlayer({
    Key? key,
    required this.songEntity,
  }) : super(key: key);

  @override
  State<SongPlayer> createState() => _SongPlayerState();
}

class _SongPlayerState extends State<SongPlayer> {
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
    return Scaffold(
      appBar: BasicAppbar(
        isHide: true,
        tittle: CustomTextwiget(
          text: 'Now Playing',
          color: context.isDarkMode ? Colors.black : Colors.white,
        ),
        action: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert_rounded,
            color: context.isDarkMode ? Colors.black : Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              _songs(context, songList),
              _songDetail(context, songList),
              const SizedBox(
                height: 20,
              ),
              _songPlayer(context, songList)
            ],
          ),
        ),
      ),
    );
  }

  Widget _songs(BuildContext context, List<SongEntity> songs) {
    return Container(
      height: 380,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
          image: AssetImage(
            widget.songEntity.image,
          ),
        ),
      ),
    );
  }

  Widget _songDetail(BuildContext context, List<SongEntity> songs) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextwiget(
              text: widget.songEntity.name, // Accessing song.name
              color: context.isDarkMode ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
              textFontsize: 25,
            ),
            CustomTextwiget(
              text: widget.songEntity.title, // Accessing song.title
              color: context.isDarkMode ? Colors.black : Colors.white,
              textFontsize: 12,
            ),
          ],
        ),
        Consumer<Favourtieprovider>(
          builder: (context, favouriteProvider, child) {
            final isFavourite = favouriteProvider.isExit(widget.songEntity);
            return IconButton(
              onPressed: () {
                // Toggle favorite logic
                favouriteProvider.toggleFavourite(widget.songEntity);
              },
              icon: Icon(
                isFavourite
                    ? Icons.favorite // If in favorites
                    : Icons.favorite_outline_outlined, // If not in favorites
                size: 35,
                color: isFavourite ? Colors.red : AppColor.darkGrey,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _songPlayer(BuildContext context, List<SongEntity> songList) {
    SongEntity currentSong = songList[0];

    return Column(
      children: [
        // Slider for audio position
        Slider(
          activeColor: context.isDarkMode ? Colors.black : Colors.white,
          max: duration.inSeconds.toDouble(),
          min: 0.0,
          value: position.inSeconds.toDouble(),
          onChanged: handleSeek,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatDuration(position),
              ),
              Text(currentSong.duraTion),
            ],
          ),
        ),

        Container(
          height: 60,
          width: 60,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
          child: IconButton(
            onPressed: handlePlayPause,
            icon: Icon(
              audioPlayer.playing ? Icons.pause : Icons.play_arrow,
              color: context.isDarkMode ? Colors.black : Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
