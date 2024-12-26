import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/common/widgets/customColumnChoseMode.dart';
import 'package:project/common/widgets/customElevatedButton.dart';
import 'package:project/common/widgets/customTextWiget.dart';
import 'package:project/core/config/assets/app_dimensions.dart';
import 'package:project/core/config/assets/app_image.dart';
import 'package:project/core/config/assets/app_vectors.dart';
import 'package:project/core/config/theme/app_color.dart';
import 'package:project/presentation/auth/pages/SignupOrSignin.dart';

import 'package:project/presentation/chooseModePage/bloc/theme_cubit.dart';

class ChoseModePage extends StatelessWidget {
  const ChoseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: AppDimensions.padingSemetric40 , horizontal: AppDimensions.padingSemetric40),
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
            padding: const EdgeInsets.symmetric(vertical: AppDimensions.padingSemetric40 , horizontal: AppDimensions.padingSemetric40),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                      },
                      child: Customcolumnchosemode(
                        text: 'Light Mode',
                        picture: AppVectors.sun,
                        isSelected: context.watch<ThemeCubit>().state ==
                            ThemeMode.light,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                      },
                      child: Customcolumnchosemode(
                        text: 'Dark Mode',
                        picture: AppVectors.moon,
                        isSelected:
                            context.watch<ThemeCubit>().state == ThemeMode.dark,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppDimensions.sizeHeight100,
                ),
                CustomElevatedButton(
                  tittle: 'Continue',
                  onpressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpOrSignIn(),
                      ),
                    );
                  },
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
