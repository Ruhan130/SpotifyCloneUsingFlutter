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
        SizedBox(
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
          alignment: Alignment.bottomLeft,
          child: Container(
            height: 40,
            width: 40,
            transform: Matrix4.translationValues(10 ,10 ,0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.isDarkMode? AppColor.darkGrey : const Color(0xffE6E6E6)
            ),
            child: Icon(Icons.play_arrow_rounded,color: context.isDarkMode?  const Color(0xff55555) : const Color(0xff959595),),
          ),
        ),
      ],
    );
  }
}
 