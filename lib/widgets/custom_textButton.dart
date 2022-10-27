import 'package:flutter/material.dart';
import 'package:itunes_musicplayer/controllers/home_page_controller.dart';
import 'package:itunes_musicplayer/theme/theme_helper.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.width,
    required this.homePagecontroller,
  }) : super(key: key);

  final double width;
  final HomePageController homePagecontroller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: width / 18, bottom: 5),
        child: Text(
          "Search",
          style: TextStyle(
            color: ThemeHelper.accentColor,
          ),
        ),
      ),
      onTap: () => {
        homePagecontroller
            .getSearchedSongs(homePagecontroller.textEditingController.text)
      },
    );
  }
}
