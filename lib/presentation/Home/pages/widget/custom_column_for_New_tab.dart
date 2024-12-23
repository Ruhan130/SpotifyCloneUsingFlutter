import 'package:flutter/material.dart';
import 'package:project/common/helper/isDark.dart';
import 'package:project/common/widgets/customTextWiget.dart';

class CustomColumnForNewTab extends StatelessWidget {
  final String image;
  final String text;

  const CustomColumnForNewTab(
      {super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        )
      ],
    );
  }
}
