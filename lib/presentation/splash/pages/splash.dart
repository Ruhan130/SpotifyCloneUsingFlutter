import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/core/config/assets/app_dimensions.dart';
import 'package:project/core/config/assets/app_vectors.dart';
import 'package:project/presentation/intro/pages/getStarted.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  @override
  void initState() {
    super.initState();
    redirect();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset(AppVectors.logo)),
    );
  }

  Future<void> redirect() async {
    await Future.delayed( const Duration(seconds: AppDimensions.splashDelay));
    
    Navigator.pushReplacement(
       
        context,
        MaterialPageRoute(
          builder: (context) => const GetStarted(),
        ));
  }
}
