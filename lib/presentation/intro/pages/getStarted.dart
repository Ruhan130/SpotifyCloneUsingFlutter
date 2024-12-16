import 'package:flutter/material.dart';
import 'package:project/core/config/assets/app_image.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImage.introBG),
              ),
            ),
          ),

          Container(
            color: Colors.black.withOpacity(0.15),
          )
        ],
      ),
    );
  }
}
