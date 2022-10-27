// ignore_for_file: sort_child_properties_last

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:itunes_musicplayer/widgets/player_control.dart';

import '../controllers/home_page_controller.dart';
import '../theme/theme_helper.dart';

class SideDetailCard extends StatelessWidget {
  const SideDetailCard({
    Key? key,
    required this.height,
    required this.width,
    required this.homePagecontroller,
  }) : super(key: key);

  final double height;
  final double width;
  final HomePageController homePagecontroller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              height: height / 7,
              width: width / 2,
              child: Image(
                image: NetworkImage(
                    homePagecontroller.songSelected.artworkUrl60 ?? "N/A"),
              ),
            ),
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                  color: ThemeHelper.shadowColor,
                  borderRadius: BorderRadius.circular(20)),
              child: IconButton(
                  onPressed: () async => {
                        if (homePagecontroller.songPlaying.value)
                          {await homePagecontroller.pauseMusic()}
                        else
                          {
                            await homePagecontroller.playMusic(UrlSource(
                                homePagecontroller.songSelected.previewUrl ??
                                    "N/A"))
                          }
                      },
                  icon: Icon(homePagecontroller.songPlaying.value
                      ? Icons.pause
                      : Icons.play_arrow)),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30),
              child: Column(children: [
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: ThemeHelper.primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    title: Text(
                        homePagecontroller.songSelected.trackName ?? "N/A"),
                    subtitle: Text(
                        homePagecontroller.songSelected.artistName ?? "N/A"),
                  ),
                ),
              ]),
            ),
          ],
        ),
        color: ThemeHelper.accentColor,
      ),
      flex: 3,
    );
  }
}
