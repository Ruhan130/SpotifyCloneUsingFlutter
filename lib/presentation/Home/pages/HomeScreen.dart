import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/common/helper/isDark.dart';
import 'package:project/common/widgets/Basic_appbar.dart';
import 'package:project/common/widgets/customTextWiget.dart';
import 'package:project/core/config/assets/app_image.dart';
import 'package:project/core/config/assets/app_vectors.dart';
import 'package:project/core/config/theme/app_color.dart';
import 'package:project/presentation/Home/pages/widget/custom_column_for_New_tab.dart';

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
            _NewRow(),

//             BlocBuilder<HomeScreenBloc, HomeScreenState>(
//   builder: (context, state) {
//     if (state is HomeScreenInitial) {
//       return const Center(
//         child: Text("Please wait......"),
//       );
//     } else if (state is HomeScreenLoading) {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     } else if (state is HomeScreenLoaded) {
//       return SizedBox(
//         height: 300  ,
//         child: ListView.builder(
//           itemCount: state.posts.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(state.posts[index].title ?? '' ),

//             );
//           },
//         ),
//       );
//     } else if (state is HomeScreenError) {
//       return Center(
//         child: Text('Error: ${state.message}'),
//       );
//     } else {
//       return Container();
//     }
//   },
// )
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

  Widget _NewRow() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            CustomColumnForNewTab(
                image: AppImage.bili_eilish2, text: 'Bili Eilish'),
            SizedBox(
              width: 10,
            ),
            CustomColumnForNewTab(image: AppImage.Drake1, text: 'Drake'),
            SizedBox(
              width: 10,
            ),
            CustomColumnForNewTab(
                image: AppImage.lana_del_rey2, text: 'Lana Del Rey'),
            SizedBox(
              width: 10,
            ),
            CustomColumnForNewTab(image: AppImage.ed_sheeran, text: 'Ed sheeran')
          ],
        ),
      ),
    );
  }
}
