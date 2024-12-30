import 'package:flutter/material.dart';
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final audioProvider =
        Provider.of<AudioPlayerProvider>(context, listen: false);

    return SizedBox(
      height: 125,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: Image.asset(
                          widget.songEntity.image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextwiget(text: widget.songEntity.name, textFontsize: AppDimensions.fontsize15,),
                        CustomTextwiget(text: widget.songEntity.title, textFontsize: AppDimensions.fontsize12,),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
