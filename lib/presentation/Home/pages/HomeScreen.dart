import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/common/helper/isDark.dart';
import 'package:project/common/widgets/Basic_appbar.dart';
import 'package:project/common/widgets/customTextWiget.dart';
import 'package:project/core/config/assets/app_dimensions.dart';
import 'package:project/core/config/assets/app_vectors.dart';
import 'package:project/core/config/theme/app_color.dart';
import 'package:project/presentation/Add_to_favourite/pages/AddToFavourite.dart';
import 'package:project/presentation/Home/model/new_songsection.dart';
import 'package:project/presentation/Home/pages/widget/HometoCard.dart';
import 'package:project/presentation/Home/pages/widget/PlayList.dart';
import 'package:project/presentation/auth/pages/SignIn.dart';
import 'package:project/presentation/song-player/song_player.dart';
import 'package:project/services/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
      with SingleTickerProviderStateMixin {
      final PrefService prefService = PrefService();
  // late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        isHide: true,
        tittle: SvgPicture.asset(
          AppVectors.logo,
          height: AppDimensions.heightLogoInHome,
          width: AppDimensions.WeightLogoInHome,
        ),
      ),
      drawer: Drawer(
        shape: const LinearBorder(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
              child: ListTile(
                leading: Icon(
                  Icons.favorite_outline,
                  color: context.isDarkMode
                      ? AppColor.textColorBlack
                      : AppColor.textColorWhite,
                ),
                title: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddToFavouritre(),
                      ),
                    );
                  },
                  child: CustomTextwiget(
                    text: 'FAVOURITE',
                    color: context.isDarkMode
                        ? AppColor.textColorBlack
                        : AppColor.textColorWhite,
                    textFontsize: AppDimensions.fontsize15,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 30),
              child: Center(
                child: InkWell(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTextwiget(
                        text: 'LOGOUT',
                        textFontsize: AppDimensions.fontsize15,
                        color: context.isDarkMode
                            ? AppColor.textColorBlack
                            : AppColor.textColorWhite,
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () async {
                         await prefService.removeChache('password');
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => SignIn()),
                            (route) => false,
                          );
                        },
                        icon: Icon(
                          Icons.logout_outlined,
                          color: context.isDarkMode
                              ? AppColor.textColorBlack
                              : AppColor.textColorWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: AppDimensions.padingBotton10),
              child: HomeToCard(),
            ),
            const SizedBox(height: AppDimensions.sizeHeight10),
            _NewText(context),
            const SizedBox(
              height: AppDimensions.sizeHeight10,
            ),
            SizedBox(
              height: 250,
              child: _NewRow(songList),
            ),
            const Playlist(),
          ],
        ),
      ),
    );
  }

  Widget _NewText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: CustomTextwiget(
        text: 'New Songs',
        textFontsize: AppDimensions.fontsize15,
        color: context.isDarkMode
            ? AppColor.textColorBlack
            : AppColor.textColorWhite,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  // Widget _tabs(BuildContext context) {
  //   return Center(
  //     child: TabBar(
  //       controller: _tabController,
  //       indicatorColor: AppColor.primary,
  //       indicatorSize: TabBarIndicatorSize.label,
  //       dividerColor: Colors.transparent,
  //       isScrollable: true,
  //       labelColor: context.isDarkMode
  //           ? AppColor.textColorBlack
  //           : AppColor.textColorWhite,
  //       tabs: const [
  //         CustomTextwiget(
  //             text: 'New',
  //             fontWeight: FontWeight.w500,
  //             textFontsize: AppDimensions.homeSizeForTabHomeScreen),
  //         CustomTextwiget(
  //             text: 'Videos',
  //             fontWeight: FontWeight.w500,
  //             textFontsize: AppDimensions.homeSizeForTabHomeScreen),
  //         CustomTextwiget(
  //             text: 'Artist',
  //             fontWeight: FontWeight.w500,
  //             textFontsize: AppDimensions.homeSizeForTabHomeScreen),
  //         CustomTextwiget(
  //             text: 'Podcasts',
  //             fontWeight: FontWeight.w500,
  //             textFontsize: AppDimensions.homeSizeForTabHomeScreen),
  //       ],
  //     ),
  //   );
  // }

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
            width: AppDimensions.sizeHeight160,
            child: Padding(
              padding: const EdgeInsets.only(left: AppDimensions.padingLeft15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: AppDimensions.containerHeight200,
                    width: AppDimensions.containerWidget140,
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
                        height: AppDimensions.containerHeightInHome,
                        width: AppDimensions.containerWidgetInHome,
                        transform: Matrix4.translationValues(
                            AppDimensions.matrixTranslate10,
                            AppDimensions.matrixTranslate10,
                            AppDimensions.matrixTranslate0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.isDarkMode
                              ? AppColor.darkGrey
                              : AppColor.textColorWhite,
                        ),
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: context.isDarkMode
                              ? AppColor.textColorWhite
                              : AppColor.textColorBlack,
                        ),
                      ),
                    ),
                  ),
                  CustomTextwiget(
                    text: song.name, // Accessing song.name
                    color: context.isDarkMode
                        ? AppColor.textColorBlack
                        : AppColor.textColorWhite,
                    fontWeight: FontWeight.w500,
                    textFontsize: AppDimensions.fontsize18,
                  ),
                  CustomTextwiget(
                    text: song.title, // Accessing song.title
                    color: context.isDarkMode
                        ? AppColor.textColorBlack
                        : AppColor.textColorWhite,
                    textFontsize: AppDimensions.homeSizeForTabHomeScreen,
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
