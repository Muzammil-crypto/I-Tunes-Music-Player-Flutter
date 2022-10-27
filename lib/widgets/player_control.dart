import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:itunes_musicplayer/controllers/home_page_controller.dart';
import 'package:itunes_musicplayer/theme/theme_helper.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({
    Key? key,
    required this.homePagecontroller,
  }) : super(key: key);

  final HomePageController homePagecontroller;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        homePagecontroller.songSelected.previewUrl ?? "N/A"))
                  }
              },
          icon: Icon(homePagecontroller.songPlaying.value
              ? Icons.pause
              : Icons.play_arrow)),
    );
  }
}
