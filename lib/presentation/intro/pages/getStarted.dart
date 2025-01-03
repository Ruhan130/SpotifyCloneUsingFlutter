import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/common/widgets/customElevatedButton.dart';
import 'package:project/core/config/assets/app_dimensions.dart';
import 'package:project/core/config/assets/app_image.dart';
import 'package:project/core/config/assets/app_vectors.dart';
import 'package:project/core/config/theme/app_color.dart';
import 'package:project/common/widgets/customTextWiget.dart';
import 'package:project/presentation/Home/pages/HomeScreen.dart';
import 'package:project/presentation/auth/pages/SignIn.dart';
import 'package:project/presentation/chooseModePage/pages/choseModePage.dart';
import 'package:project/services/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  final PrefService prefService = PrefService();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: AppDimensions.padingSemetric40,
                horizontal: AppDimensions.padingSemetric40),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImage.introBG),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppDimensions.padingSemetric40,
                horizontal: AppDimensions.padingSemetric40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo),
                ),
                const Spacer(),
                const CustomTextwiget(
                  text: 'Enjoy Listening to Music',
                  textFontsize: AppDimensions.fontsize18,
                  color: AppColor.textColorWhite,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: AppDimensions.sizeHeight20,
                ),
                const CustomTextwiget(
                  text:
                      'Spotify offers a basic, free service with ads and limited control, as well as paid subscription options that include additional features like offline listening and commercial-free listening',
                  textFontsize: AppDimensions.getStartedDescriptionText,
                  color: AppColor.textColorWhite,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppDimensions.sizeHeight20,
                ),
                CustomElevatedButton(
                  tittle: 'Get Started',
                  onpressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChoseModePage(),
                      ),
                    );
                  },
                  // onpressed: () async {
                  //   SharedPreferences prefs =
                  //       await SharedPreferences.getInstance();
                  //   await prefs.setBool(
                  //       'isFirstTime', false); // Mark as not first-time

                  //   Navigator.pushReplacementNamed(context, '/signIn');
                  // },
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
