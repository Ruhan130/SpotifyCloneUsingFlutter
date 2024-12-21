import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String tittle;
  final double? height;
  final Color? textColor;
  const CustomElevatedButton(
      {super.key,
      required this.tittle,
      required this.onpressed,
      this.height,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 60),
      ),
      child: Text(
        tittle,
        style: TextStyle(color: textColor, fontSize: 20),
      ),
    );
  }
}
