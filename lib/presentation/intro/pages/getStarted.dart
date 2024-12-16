import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/common/customElevatedButton.dart';
import 'package:project/core/config/assets/app_dimensions.dart';
import 'package:project/core/config/assets/app_image.dart';
import 'package:project/core/config/assets/app_vectors.dart';
import 'package:project/core/config/theme/app_color.dart';
import 'package:project/common/customTextWiget.dart';
import 'package:project/presentation/chooseModePage/pages/choseModePage.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

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
                image: AssetImage(AppImage.introBG),
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 40),
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
                    height: 21,
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
                    height: 20,
                  ),
                  CustomElevatedButton(tittle: 'Get Started', onpressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ChoseModePage(),));
                  } ,textColor: Colors.white,)
                ],
              ),
          ),
        ],
      ),
    );
  }
}
