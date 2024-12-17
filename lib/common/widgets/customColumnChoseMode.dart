import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Customcolumnchosemode extends StatelessWidget {
  final String text;
  final String picture;
  final bool isSelected;

  const Customcolumnchosemode({
    required this.text,
    required this.picture,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? Colors.blue : Colors.transparent,
          ),
          child: SvgPicture.asset(
            picture,
            height: 50,
            width: 50,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.blue : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
