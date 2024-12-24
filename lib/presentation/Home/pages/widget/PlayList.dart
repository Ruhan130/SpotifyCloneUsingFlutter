import 'package:flutter/material.dart';
import 'package:project/common/helper/isDark.dart';
import 'package:project/common/widgets/customTextWiget.dart';
import 'package:project/core/config/theme/app_color.dart';

class Playlist extends StatelessWidget {
  Playlist({super.key});

  final List<Map<String, String>> songs = [
    {"song": "Dusk Till Dawn", "singer": "Zayn Malik & Sia"},
    {"song": "No Lie", "singer": "Sean Paul"},
    {"song": "Dont't Let me Down", "singer": "The Chainsmokers"},
    {"song": "Falling", "singer": "Trevor Daniel"},
  ];

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
          SizedBox(height: MediaQuery.sizeOf(context).height ,child: _playList(songs))
        ],
      ),
    );
  }

  Widget _playList(List<Map<String, String>> songs) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
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
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: context.isDarkMode ? Colors.white : Colors.black,
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
                    text: songs[index]['song'] ?? '',
                    fontWeight: FontWeight.bold,
                    textFontsize: 15,
                    color: context.isDarkMode
                        ? AppColor.darkGrey
                        : const Color(0xffE6E6E6),
                  ),
                  CustomTextwiget(
                    text: songs[index]['singer'] ?? '',
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
                    text: "3:56",
                    textFontsize: 15,
                    color: context.isDarkMode
                        ? AppColor.darkGrey
                        : const Color(0xffE6E6E6),
                  ),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_rounded,color: AppColor.darkGrey,))
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
        itemCount: songs.length);
  }
}
