import 'package:flutter/material.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? tittle;
  final bool isHide;
  final Widget? action;
  const BasicAppbar({super.key, this.tittle,required this.isHide, this.action});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: tittle ?? const Text(''),
      automaticallyImplyLeading: true,
      // leading: isHide == false ? IconButton(
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //         icon: Container(
      //           height: 50,
      //           width: 50,
      //           decoration: BoxDecoration(
      //             color: Theme.of(context).brightness == Brightness.dark
      //                 ? Colors.white.withOpacity(0.13)
      //                 : Colors.black.withOpacity(0.13),
      //             shape: BoxShape.circle,
      //           ),
      //           child: Icon(
      //             Icons.arrow_back_ios_new_rounded,
      //             size: 15,
      //             color: Theme.of(context).brightness == Brightness.dark
      //                 ? Colors.white
      //                 : Colors.black,
      //           ),
      //         ),
      //       ): SizedBox()
          // : Builder(
          //     builder: (context) {
          //       return IconButton(
          //         onPressed: () {
          //           Scaffold.of(context).openDrawer();
          //         },
          //         icon: Icon(
          //           Icons.menu_sharp,
          //           color: Theme.of(context).brightness == Brightness.dark
          //               ? Colors.white
          //               : Colors.black,
          //         ),
          //       );
          //     },
          //   ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
