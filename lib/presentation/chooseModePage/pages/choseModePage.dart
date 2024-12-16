import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/common/customColumnChoseMode.dart';
import 'package:project/common/customElevatedButton.dart';
import 'package:project/common/customTextWiget.dart';
import 'package:project/core/config/assets/app_dimensions.dart';
import 'package:project/core/config/assets/app_image.dart';
import 'package:project/core/config/assets/app_vectors.dart';
import 'package:project/core/config/theme/app_color.dart';

class ChoseModePage extends StatelessWidget {
  const ChoseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImage.choseModepicture),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo),
                ),
                const Spacer(),
                const CustomTextwiget(
                  text: 'Choose Mode',
                  textFontsize: AppDimensions.fontsize18,
                  color: AppColor.textColorWhite,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 21,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Customcolumnchosemode(
                        text: 'Light Mode', picture: AppVectors.sun),
                    SizedBox(
                      width: 50,
                    ),
                    Customcolumnchosemode(
                        text: 'Dark Mode', picture: AppVectors.moon)
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                CustomElevatedButton(
                  tittle: 'Get Started',
                  onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChoseModePage(),
                        ));
                  },
                  textColor: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
