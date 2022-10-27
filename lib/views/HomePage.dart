// ignore_for_file: sort_child_properties_last

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itunes_musicplayer/controllers/home_page_controller.dart';
import 'package:itunes_musicplayer/theme/theme_helper.dart';
import 'package:itunes_musicplayer/widgets/custom_iconButton.dart';
import 'package:itunes_musicplayer/widgets/custom_textButton.dart';
import 'package:itunes_musicplayer/widgets/message_card.dart';
import 'package:itunes_musicplayer/widgets/search_field.dart';
import 'package:itunes_musicplayer/widgets/side_details_card.dart';

class HomePage extends StatelessWidget {
  final HomePageController homePagecontroller = Get.put(HomePageController());
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Obx(
      () => Scaffold(
        backgroundColor: ThemeHelper.secondry,
        appBar: AppBar(
          backgroundColor: ThemeHelper.secondry,
          title: Center(
            child: homePagecontroller.search.value
                ? Container(
                    decoration: BoxDecoration(
                        color: ThemeHelper.primaryColor,
                        borderRadius: BorderRadius.circular(18)),
                    width: width / 1.7,
                    child: Row(
                      children: [
                        SearchField(
                            width: width,
                            focusNode: focusNode,
                            homePagecontroller: homePagecontroller),
                        CustomTextButton(
                            width: width,
                            homePagecontroller: homePagecontroller)
                      ],
                    ))
                : Text(
                    "My Playlist",
                    style: TextStyle(color: ThemeHelper.accentColor),
                  ),
          ),
          actions: [
            CustomIconButtons(homePagecontroller: homePagecontroller),
          ],
        ),
        body: Center(
            child: Obx(
          () => homePagecontroller.isLoading.value
              ? const CircularProgressIndicator()
              : Container(
                  // margin: EdgeInsets.only(top: 10),
                  child: Row(children: [
                    Expanded(
                      child: Container(
                        child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: ThemeHelper.primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                color: ThemeHelper.primaryColor,
                                child: ListTile(
                                  title: Text(
                                    homePagecontroller.musicModel.songs
                                            ?.elementAt(index)
                                            .trackName ??
                                        "N/A",
                                    style:
                                        TextStyle(color: ThemeHelper.secondry),
                                  ),
                                  subtitle: Text(
                                    homePagecontroller.musicModel.songs
                                            ?.elementAt(index)
                                            .artistName ??
                                        "N/A",
                                    style:
                                        TextStyle(color: ThemeHelper.secondry),
                                  ),
                                  trailing: Icon(
                                    Icons.play_arrow,
                                    color: ThemeHelper.accentColor,
                                  ),
                                  leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          homePagecontroller.musicModel.songs
                                                  ?.elementAt(index)
                                                  .artworkUrl60 ??
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCT_yPqjGgX7UQpfBxW-luzlIwDaKpjJgTmaEJYH4Q0Q&s")),
                                  onTap: () {
                                    homePagecontroller.selectSong(index);
                                  },
                                ),
                                elevation: 5,
                              );
                            },
                            itemCount:
                                homePagecontroller.musicModel.songs?.length ??
                                    0),
                        color: ThemeHelper.secondry,
                      ),
                      flex: 4,
                    ),
                    homePagecontroller.songClicked.value
                        ? Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(top: 30),
                              child: Column(
                                children: [
                                  // ignore: sized_box_for_whitespace
                                  Container(
                                    height: height / 7,
                                    width: width / 2,
                                    child: Image(
                                      image: NetworkImage(homePagecontroller
                                              .songSelected.artworkUrl60 ??
                                          "N/A"),
                                    ),
                                  ),
                                  Container(
                                    height: 44,
                                    width: 44,
                                    decoration: BoxDecoration(
                                        color: ThemeHelper.shadowColor,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: IconButton(
                                        onPressed: () async => {
                                              if (homePagecontroller
                                                  .songPlaying.value)
                                                {
                                                  await homePagecontroller
                                                      .pauseMusic()
                                                }
                                              else
                                                {
                                                  await homePagecontroller
                                                      .playMusic(UrlSource(
                                                          homePagecontroller
                                                                  .songSelected
                                                                  .previewUrl ??
                                                              "N/A"))
                                                }
                                            },
                                        icon: Icon(
                                            homePagecontroller.songPlaying.value
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
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: ListTile(
                                          title: Text(homePagecontroller
                                                  .songSelected.trackName ??
                                              "N/A"),
                                          subtitle: Text(homePagecontroller
                                                  .songSelected.artistName ??
                                              "N/A"),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                              color: ThemeHelper.accentColor,
                            ),
                            flex: 3,
                          )
                        : MessageCard(),
                  ]),
                ),
        )),
      ),
    );
  }
}
