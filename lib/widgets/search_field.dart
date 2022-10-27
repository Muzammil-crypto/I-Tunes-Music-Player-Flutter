import 'package:flutter/material.dart';
import 'package:itunes_musicplayer/controllers/home_page_controller.dart';
import 'package:itunes_musicplayer/theme/theme_helper.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.width,
    required this.focusNode,
    required this.homePagecontroller,
  }) : super(key: key);

  final double width;
  final FocusNode focusNode;
  final HomePageController homePagecontroller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ThemeHelper.accentColor,
          borderRadius: BorderRadius.circular(18)),
      width: width / 2.9,
      child: TextField(
          focusNode: focusNode,
          controller: homePagecontroller.textEditingController,
          style: TextStyle(
            fontSize: 15.0,
            color: ThemeHelper.secondry,
          ),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              prefixIcon: Icon(
                Icons.search,
                color: ThemeHelper.primaryColor,
              ),
              hintText: "Search the Artist",
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ThemeHelper.accentColor, width: 25.0),
                  borderRadius: BorderRadius.circular(18.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ThemeHelper.accentColor, width: 25.0),
                  borderRadius: BorderRadius.circular(18.0)))),
    );
  }
}
