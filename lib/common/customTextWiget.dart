import 'package:flutter/material.dart';

class CustomTextwiget extends StatelessWidget {
  final String text;
  final double? textFontsize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;

  const CustomTextwiget(
      {super.key,
      required this.text,
      this.textFontsize,
      this.fontFamily,
      this.fontWeight,
      this.color,this.textAlign});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: textFontsize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        color: color,
        
      ),
    );
  }
}
