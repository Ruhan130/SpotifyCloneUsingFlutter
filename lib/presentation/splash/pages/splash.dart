import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/core/config/assets/app_dimensions.dart';
import 'package:project/core/config/assets/app_vectors.dart';
import 'package:project/presentation/Home/pages/HomeScreen.dart';
import 'package:project/presentation/auth/pages/SignIn.dart';
import 'package:project/presentation/intro/pages/getStarted.dart';
import 'package:project/services/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required bool isFirstTime});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final PrefService prefService = PrefService();
  @override
  void initState() {
    super.initState();

    // Check first-time and authentication status
    _navigateBasedOnCondition();
  }

  Future<void> _navigateBasedOnCondition() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    // Navigate after 3 seconds
    Timer(const Duration(seconds: 3), () async {
      if (isFirstTime) {
        // First-time user -> Navigate to Get Started
        await prefs.setBool(
            'isFirstTime', false); // Set to false after first use
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const GetStarted()),
          (route) => false,
        );
      } else {
        // Returning user -> Check login status
        String? password = await prefService.readCache("password");
        if (password != null) {
          // User is logged in -> Navigate to Home Page
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false,
          );
        } else {
          // User is not logged in -> Navigate to Sign In Page
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => SignIn()),
            (route) => false,
          );
        }
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset(AppVectors.logo)),
    );
  }

  // Future<void> redirect() async {
  //   await Future.delayed(const Duration(seconds: AppDimensions.splashDelay));

  //   Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const GetStarted(),
  //       ));
  // }
}
