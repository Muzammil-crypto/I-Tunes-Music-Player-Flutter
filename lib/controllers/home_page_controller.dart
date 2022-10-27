import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:itunes_musicplayer/models/music_model.dart';

import '../network/network_services.dart';

class HomePageController extends GetxController {
  MusicModel musicModel = MusicModel();
  RxBool isLoading = true.obs;
  RxBool songClicked = false.obs;
  RxBool songPlaying = false.obs;
  RxBool search = false.obs;
  TextEditingController textEditingController = TextEditingController();

  Song songSelected = Song();
  final player = AudioPlayer();

  @override
  void onInit() {
    getSongs();

    super.onInit();
  }

  void getSongs() async {
    await NetworkServices(keyWord: "Shakira").getRequest().then((value) {
      if (value != null) {
        musicModel = MusicModel.fromJson(value);
        isLoading.value = false;
      }
    });
  }

  void getSearchedSongs(keyword) async {
    print("SEARCHED WORD IS ${keyword}");
    await NetworkServices(keyWord: keyword).getRequest().then((value) {
      if (value != null) {
        musicModel = MusicModel.fromJson(value);
        isLoading.value = false;
      }
    });
  }

  void selectSong(int index) {
    songClicked.value = false;
    songSelected = musicModel.songs?.elementAt(index) ?? Song();
    songClicked.value = true;
  }

  playMusic(url) async {
    await player.play(url);
    songPlaying.value = true;
  }

  pauseMusic() async {
    await player.pause();
    songPlaying.value = false;
  }

  searchClicked(value) async {
    search.value = value;
    print("Clicekd");
  }
}
