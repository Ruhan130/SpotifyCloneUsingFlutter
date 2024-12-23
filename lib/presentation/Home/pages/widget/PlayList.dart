import 'package:flutter/material.dart';
import 'package:project/common/helper/isDark.dart';
import 'package:project/common/widgets/customTextWiget.dart';

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextwiget(text: 'Playlist', color: context.isDarkMode ? Colors.black : Colors.white ,fontWeight: FontWeight.w500,textFontsize: 15, ),
              CustomTextwiget(text: 'See more', color: context.isDarkMode ? Colors.black : Colors.white ,fontWeight: FontWeight.w500,textFontsize: 15, ),
            ],
          )
        ],
      ),
    );
  }
}