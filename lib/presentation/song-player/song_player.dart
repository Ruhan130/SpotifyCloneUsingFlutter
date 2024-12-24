import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/common/helper/isDark.dart';
import 'package:project/common/widgets/Basic_appbar.dart';
import 'package:project/common/widgets/customTextWiget.dart';
import 'package:project/core/config/theme/app_color.dart';
import 'package:project/presentation/Home/model/new_songsection.dart';
import 'package:project/presentation/song-player/bloc/song_player_cubmit.dart';
import 'package:project/presentation/song-player/bloc/song_player_state.dart';

class SongPlayer extends StatelessWidget {
  final SongEntity songEntity;
  const SongPlayer({super.key, required this.songEntity});

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
      body:  BlocProvider( create: (_) => SongPlayerCubmit(songEntity)..loadSong(songList),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                _songs(context, songList),
                _songDetail(context, songList),
                const SizedBox(height: 20,),
                _songPlayer(context)
              ],
            ),
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
            songEntity.image,
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
              text: songEntity.name, // Accessing song.name
              color: context.isDarkMode ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
              textFontsize: 25,
            ),
            CustomTextwiget(
              text: songEntity.title, // Accessing song.title
              color: context.isDarkMode ? Colors.black : Colors.white,
              textFontsize: 12,
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_outline_outlined,
            size: 35,
            color: AppColor.darkGrey,
          ),
        ),
      ],
    );
  }

  Widget _songPlayer(BuildContext context) {
    return BlocBuilder<SongPlayerCubmit, SongPlayerState>(
        builder: (context, State){
      if (State is SongPlayerLoaded) {
        return Column(
          children: [
            Slider(
                value: context
                    .read<SongPlayerCubmit>()
                    .songPosition
                    .inSeconds
                    .toDouble(),
                min: 0.0,
                max: context
                    .read<SongPlayerCubmit>()
                    .songDuration
                    .inSeconds
                    .toDouble(),
                onChanged: (value) {})
          ],
        );
      }
      return Container();
    },
    );
  }
}
