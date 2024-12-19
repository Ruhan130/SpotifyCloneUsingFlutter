import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/common/widgets/Basic_appbar.dart';
import 'package:project/core/config/assets/app_vectors.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        isHide: true,
        tittle: SvgPicture.asset(AppVectors.logo, height: 40, width: 40,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }

}
