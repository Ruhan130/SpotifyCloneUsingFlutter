import 'package:flutter/material.dart';
import 'package:project/common/widgets/Basic_appbar.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
    );
  }
}