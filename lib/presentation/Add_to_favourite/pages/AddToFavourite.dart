import 'package:flutter/material.dart';
import 'package:project/common/widgets/Basic_appbar.dart';

class AddToFavouritre extends StatelessWidget {
  const AddToFavouritre({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppbar(
        isHide: true,
        tittle: Text('Add To Favourite'),
      ),
    );
  }
}