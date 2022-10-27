import 'package:flutter/material.dart';
import 'package:itunes_musicplayer/controllers/home_page_controller.dart';

class CustomIconButtons extends StatelessWidget {
  const CustomIconButtons({
    Key? key,
    required this.homePagecontroller,
  }) : super(key: key);

  final HomePageController homePagecontroller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        homePagecontroller.searchClicked(!homePagecontroller.search.value);
      },
      child: homePagecontroller.search.value
          ? const Icon(Icons.close)
          : const Icon(Icons.search),
    );
  }
}
