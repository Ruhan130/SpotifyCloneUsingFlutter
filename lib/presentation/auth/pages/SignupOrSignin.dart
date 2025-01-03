import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/common/widgets/Basic_appbar.dart';
import 'package:project/common/widgets/customElevatedButton.dart';
import 'package:project/common/widgets/customTextWiget.dart';
import 'package:project/core/config/assets/app_dimensions.dart';
import 'package:project/core/config/assets/app_image.dart';
import 'package:project/core/config/assets/app_vectors.dart';
import 'package:project/core/config/theme/app_color.dart';
import 'package:project/presentation/auth/pages/SignIn.dart';
import 'package:project/presentation/auth/pages/signup.dart';

class SignUpOrSignIn extends StatefulWidget {
  const SignUpOrSignIn({super.key});

  @override
  State<SignUpOrSignIn> createState() => _SignUpOrSignInState();
}

class _SignUpOrSignInState extends State<SignUpOrSignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor, // Dynamic background
          appBar:  const BasicAppbar(isHide: false,),
      body: Stack(
        children: [
         
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImage.authBg),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimensions.padingSemetric40 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVectors.logo),
                  const SizedBox(
                    height: 30,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: CustomTextwiget(
                      text: "Enjoy Listening to Music",
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColor.textColorWhite
                          : AppColor.textColorBlack,
                      fontWeight: FontWeight.bold,
                      textFontsize: AppDimensions.fontsize26,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: AppDimensions.sizeHeight20,
                  ),
                  const CustomTextwiget(
                    text:
                        'Spotify is a proprietary Swedish audio streaming and media services provider',
                    textFontsize: AppDimensions.fontsize12,
                    color: Colors.grey,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: AppDimensions.sizeHeight20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomElevatedButton(
                          tittle: 'Register',
                          textColor:
                              Theme.of(context).brightness == Brightness.dark
                                  ? AppColor.textColorWhite
                                  : AppColor.textColorWhite,
                          onpressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  SignUp(),
                                ));
                          },
                        ),
                      ),
                      const SizedBox(
                        width: AppDimensions.sizeHeight10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  SignIn(),
                              ));
                        },
                        child: CustomTextwiget(
                          text: 'Sign In',
                          fontWeight: FontWeight.bold,
                          textFontsize: AppDimensions.fontsize18,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColor.textColorWhite
                              : AppColor.textColorBlack,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
