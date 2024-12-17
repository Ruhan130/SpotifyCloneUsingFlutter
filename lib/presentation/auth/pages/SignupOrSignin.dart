import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/common/customElevatedButton.dart';
import 'package:project/common/customTextWiget.dart';
import 'package:project/core/config/assets/app_image.dart';
import 'package:project/core/config/assets/app_vectors.dart';

class SignUpOrSignIn extends StatefulWidget {
  const SignUpOrSignIn({super.key});

  @override
  State<SignUpOrSignIn> createState() => _SignUpOrSignInState();
}

class _SignUpOrSignInState extends State<SignUpOrSignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, // Dynamic background
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
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVectors.logo),
                  const SizedBox(
                    height: 30,
                  ),
                  const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: CustomTextwiget(
                      text: "Enjoy Listening to Music",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      textFontsize: 26,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextwiget(
                    text:
                        'Spotify is a proprietary Swedish audio streaming and media services provider',
                    textFontsize: 10,
                    color: Colors.grey,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomElevatedButton(
                          tittle: 'Register',
                          onpressed: () {},
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: CustomTextwiget(
                          text: 'Sign In',
                          fontWeight: FontWeight.bold,
                          textFontsize: 18,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
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
