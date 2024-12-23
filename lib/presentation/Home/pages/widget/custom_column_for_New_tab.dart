import 'package:flutter/material.dart';
import 'package:project/common/helper/isDark.dart';
import 'package:project/common/widgets/customTextWiget.dart';
import 'package:project/core/config/theme/app_color.dart';

class CustomColumnForNewTab extends StatelessWidget {
  final String image;
  final String text;

  const CustomColumnForNewTab(
      {super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            height: 180,
            width: 140,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTextwiget(
          text: text,
          color: context.isDarkMode ? Colors.black : Colors.white,
          fontWeight: FontWeight.w500,
          textFontsize: 15,
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            height: 40,
            width: 40,
            transform: Matrix4.translationValues(10 ,10 ,0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.isDarkMode? AppColor.darkGrey : const Color(0xffE6E6E6)
            ),
            child: Icon(Icons.play_arrow_rounded,color: context.isDarkMode?   Colors.white : Colors.black,),
          ),
        ),
      ],
    );
  }
}
 
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
 // Widget _NewRow() {
  //   return const SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Padding(
  //       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //       child: Row(
  //         children: [
  //           CustomColumnForNewTab(
  //               image: AppImage.bili_eilish2, text: 'Bili Eilish'),
  //           SizedBox(
  //             width: 10,
  //           ),
  //           CustomColumnForNewTab(image: AppImage.Drake1, text: 'Drake'),
  //           SizedBox(
  //             width: 10,
  //           ),
  //           CustomColumnForNewTab(
  //               image: AppImage.lana_del_rey2, text: 'Lana Del Rey'),
  //           SizedBox(
  //             width: 10,
  //           ),
  //           CustomColumnForNewTab(
  //               image: AppImage.ed_sheeran, text: 'Ed sheeran')
  //         ],
  //       ),
  //     ),
  //   );
  // }