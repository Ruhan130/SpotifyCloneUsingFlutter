import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/common/customColumnChoseMode.dart';
import 'package:project/common/customElevatedButton.dart';
import 'package:project/common/customTextWiget.dart';
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                      },
                      child: const Customcolumnchosemode(
                          text: 'Light Mode', picture: AppVectors.sun),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xff30393C).withOpacity(0.5),
                                ),
                                child: SvgPicture.asset(
                                  AppVectors.moon,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const CustomTextwiget(
                          text: 'Dark Mode',
                          color: AppColor.textColorWhite,
                          fontWeight: FontWeight.w500,
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                CustomElevatedButton(
                  tittle: 'Continoue',
                  onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpOrSignIn(),
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
