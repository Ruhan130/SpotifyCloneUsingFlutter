import 'package:flutter/material.dart';
import 'package:project/common/helper/isDark.dart';
import 'package:project/common/widgets/Basic_appbar.dart';
import 'package:project/common/widgets/customTextWiget.dart';
import 'package:project/presentation/Add_to_favourite/provider/FavourtieProvider.dart';
import 'package:project/presentation/Home/pages/HomeScreen.dart';

class AddToFavouritre extends StatefulWidget {
  const AddToFavouritre({super.key});

  @override
  State<AddToFavouritre> createState() => _AddToFavouritreState();
}

class _AddToFavouritreState extends State<AddToFavouritre> {
  @override
  Widget build(BuildContext context) {
    final provider = Favourtieprovider.of(context);
    final playlist = provider.favourite;
    return Scaffold(
      appBar: const BasicAppbar(
        isHide: true,
        tittle: Text('Favourite'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, left: 30),
            child: CustomTextwiget(
              text: 'Public PlayList',
              textFontsize: 20,
              fontWeight: FontWeight.bold,
              color: context.isDarkMode ? Colors.black : Colors.white,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: playlist.length,
              itemBuilder: (context, index) {
                final favItem = playlist[index];
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              height: 95,
                              width: 85,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  favItem.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextwiget(
                                  text: favItem.name,
                                  textFontsize: 15,
                                  color: context.isDarkMode
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomTextwiget(
                                  text: favItem.title,
                                  textFontsize: 12,
                                  color: context.isDarkMode
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 55,
                      right: 35,
                      child: GestureDetector(
                        onTap: () {
                          playlist.removeAt(index);
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
