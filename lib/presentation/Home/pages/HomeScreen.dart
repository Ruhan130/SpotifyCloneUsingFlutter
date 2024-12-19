import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
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

  @override
  void initState() {
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
            const SizedBox(
              height: 10,
              
            ),
            _tabs(context),
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
            CustomTextwiget(text: 'News', fontWeight: FontWeight.w500,textFontsize: 12,),
            CustomTextwiget(text: 'Videos', fontWeight: FontWeight.w500,textFontsize: 12,),
            CustomTextwiget(text: 'Artist', fontWeight: FontWeight.w500,textFontsize: 12,),
            CustomTextwiget(text: 'Podcasts', fontWeight: FontWeight.w500,textFontsize: 12,),
          ]),
    );
  }
}
