import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/common/customTextWiget.dart';
import 'package:project/core/config/theme/app_color.dart';

class Customcolumnchosemode extends StatelessWidget {
  final String text ;
  final String picture;
  const Customcolumnchosemode({super.key, required this.text,required this.picture});
  
  // final String text ;

  @override
  Widget build(BuildContext context) {
    return   Column(
                      children: [
                        ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration:  BoxDecoration(
                                color: const Color(0xff30393C).withOpacity(0.5),
                              ),
                              child: SvgPicture.asset(picture ,fit: BoxFit.none,),
                            ),
                          ),
                        ),
                         CustomTextwiget(text: text, color: AppColor.textColorWhite, fontWeight: FontWeight.w500,)
                      ],
                    );
  }
}