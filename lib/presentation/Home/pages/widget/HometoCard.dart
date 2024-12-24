import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/core/config/assets/app_image.dart';
import 'package:project/core/config/assets/app_vectors.dart';

class HomeToCard extends StatelessWidget {
  const HomeToCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 180,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(AppVectors.home_top_card),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Image.asset(
                  AppImage.home_artist,
                  height: 140,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}