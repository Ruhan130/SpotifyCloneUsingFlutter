import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/common/helper/isDark.dart';
import 'package:project/common/widgets/Basic_appbar.dart';
import 'package:project/common/widgets/customTextWiget.dart';
import 'package:project/core/config/assets/app_image.dart';
import 'package:project/core/config/assets/app_vectors.dart';
import 'package:project/core/config/theme/app_color.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
      
  late TabController _tabController;

  final List<Map<String, String>> songs = [
    {"name": "Lovely", "title": "Billie Bilish", "image": AppImage.bili_eilish2 },
    {"name": "One Dance", "title": "Drake", "image": AppImage.Drake1},
    {"name": "Perfect", "title": "Ed Sheeran", "image": AppImage.ed_sheeran},
    {"name": "Say Yes to heaven", "title": "Lana Del Rey", "image": AppImage.lana_del_rey1},
  ];

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
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _homeToCard(context),
            ),
            const SizedBox(height: 10),
            _tabs(context),
            SizedBox(height: 10,),
            // Add a specific height or other constraints to the ListView
            SizedBox(
              height: 250, // Explicit height
              child: _NewRow(songs),
            ),
          ],
        ),
      ),
    );
  }

  Widget _homeToCard(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 180,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(AppVectors.home_top_card),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Image.asset(
                  AppImage.home_artist,
                  height: 140,
                ),
              ),
            ),
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
  Widget _NewRow(List<Map<String, String>> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true, // Ensures ListView doesn't take more space than needed
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return 
         
        SizedBox(
            width: 160,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: 180,
                      width: 140,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(songs[index]['image'] ?? ''),
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
                                  : const Color(0xffE6E6E6)),
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: context.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomTextwiget(
                    text: songs[index]['name'] ?? '',
                    color: context.isDarkMode ? Colors.black : Colors.white,fontWeight: FontWeight.w500,
                    textFontsize: 18,
                  ),
                  CustomTextwiget(
                    text: songs[index]['title'] ?? '',
                    color: context.isDarkMode ? Colors.black : Colors.white,
                    textFontsize: 12,
                  ),
                ],
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
