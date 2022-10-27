// ignore_for_file: sort_child_properties_last

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itunes_musicplayer/controllers/home_page_controller.dart';
import 'package:itunes_musicplayer/theme/theme_helper.dart';
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
            GestureDetector(
              onTap: () {
                homePagecontroller
                    .searchClicked(!homePagecontroller.search.value);
              },
              child: homePagecontroller.search.value
                  ? const Icon(Icons.close)
                  : const Icon(Icons.search),
            ),
          ],
        ),
        body: Center(
            child: Obx(
          () => homePagecontroller.isLoading.value
              ? const CircularProgressIndicator()
              : Container(
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
                        ? SideDetailCard(
                            height: height,
                            width: width,
                            homePagecontroller: homePagecontroller)
                        : MessageCard(),
                  ]),
                ),
        )),
      ),
    );
  }
}
