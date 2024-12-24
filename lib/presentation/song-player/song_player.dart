import 'package:flutter/material.dart';
import 'package:project/common/helper/isDark.dart';
import 'package:project/common/widgets/Basic_appbar.dart';
import 'package:project/common/widgets/customTextWiget.dart';
import 'package:project/presentation/Home/model/new_songsection.dart';

class SongPlayer extends StatelessWidget {
  final SongEntity songEntity ;
  const SongPlayer({super.key , required this.songEntity});

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
    );
  }
}
