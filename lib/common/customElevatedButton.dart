import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String tittle;
  final double? height;
  const CustomElevatedButton({
    super.key,
    required this.tittle,
    required this.onpressed,
    this.height

  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(height ?? 80 )),
      child: Text(tittle),
    );
  }
}
