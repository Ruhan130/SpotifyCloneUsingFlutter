import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/common/helper/isDark.dart';
import 'package:project/common/widgets/Basic_appbar.dart';
import 'package:project/common/widgets/customTextWiget.dart';
import 'package:project/core/config/assets/app_vectors.dart';
import 'package:project/core/config/theme/app_color.dart';
import 'package:project/presentation/Add_to_favourite/pages/AddToFavourite.dart';
import 'package:project/presentation/Home/model/new_songsection.dart';
import 'package:project/presentation/Home/pages/widget/HometoCard.dart';
import 'package:project/presentation/Home/pages/widget/PlayList.dart';
// import 'package:project/presentation/profile/profile.dart';
import 'package:project/presentation/song-player/song_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        isHide: false,
        tittle: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
        action: Container(height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.isDarkMode ? Colors.black : AppColor.darkGrey,
        ),
          child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddToFavouritre(),
                    ));
              },
              icon:  Icon(Icons.favorite_border, color: context.isDarkMode ? Colors.black : Colors.white,)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: HomeToCard(),
            ),
            const SizedBox(height: 10),

            _tabs(context),

            const SizedBox(
              height: 20,
            ),
            // Add a specific height or other constraints to the ListView
            SizedBox(
              height: 250, // Explicit height
              child: _NewRow(songList),
            ),

            Playlist(),
          ],
        ),
      ),
    );
  }

  Widget _tabs(BuildContext context) {
    return Center(
      child: TabBar(
        controller: _tabController,
        indicatorColor: AppColor.primary,
        indicatorSize: TabBarIndicatorSize.label,
        dividerColor: Colors.transparent,
        isScrollable: true,
        labelColor: context.isDarkMode ? Colors.black : Colors.white,
        tabs: const [
          CustomTextwiget(
              text: 'New', fontWeight: FontWeight.w500, textFontsize: 12),
          CustomTextwiget(
              text: 'Videos', fontWeight: FontWeight.w500, textFontsize: 12),
          CustomTextwiget(
              text: 'Artist', fontWeight: FontWeight.w500, textFontsize: 12),
          CustomTextwiget(
              text: 'Podcasts', fontWeight: FontWeight.w500, textFontsize: 12),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _NewRow(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: songs.length,
      itemBuilder: (context, index) {
        final song = songs[index]; // Accessing SongEntity object
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SongPlayer(songEntity: song),
              ),
            );
          },
          child: SizedBox(
            width: 160,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(song.image), // Accessing song.image
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 40,
                        width: 40,
                        transform: Matrix4.translationValues(10, 10, 0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.isDarkMode
                              ? AppColor.darkGrey
                              : const Color(0xffE6E6E6),
                        ),
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color:
                              context.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  CustomTextwiget(
                    text: song.name, // Accessing song.name
                    color: context.isDarkMode ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w500,
                    textFontsize: 18,
                  ),
                  CustomTextwiget(
                    text: song.title, // Accessing song.title
                    color: context.isDarkMode ? Colors.black : Colors.white,
                    textFontsize: 12,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 0,
      ),
    );
  }
}
