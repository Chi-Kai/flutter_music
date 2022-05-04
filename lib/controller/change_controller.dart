import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:music/config.dart';
import 'package:music/models/music_list.dart';
import 'package:music/models/search_result.dart';

class ChangeController extends GetxController {
  static ChangeController get to => Get.find();
  var musicName = 'Select Your Music'.obs;
  var singer = ''.obs;
  var nowplay = -1.obs;
  final localmusic = <Music>[].obs;
  //var nowmusic = Music(name: 'Select Your Music',singer: '',path: '',time: '').obs; // 试过用类，有问题
  var playstate = false.obs;
  var player = AudioPlayer().obs;
  var routepage = 0.obs;
  final zoomDrawerController = ZoomDrawerController(); // 侧边栏控制器
  var searchres = <Song>[].obs; // 存放搜索结果。
  var hasmore  = true.obs; // 是否还有搜索结果
  var searchkey = "".obs; // 当前搜索关键词

  void changelocalsong(String name, String singername, String path, int index) {
    musicName.value = name;
    singer.value = singername;
    nowplay = index;
    //nowmusic.value.name = name;
    //nowmusic.value.singer = singername;
    // 有问题
    player().setFilePath(path);
    update(); // 立即更新重建
  }

  void changenetsong(String name, String singername, String url, int id) async {
    musicName.value = name;
    singer.value = singername;
    nowplay = id;
    // ignore: unnecessary_string_interpolations
    await player().setUrl('$url'); //格式不对，错了半天
    update(); // 立即更新重建
  }

  void playerstart() {
    player().play();
    playstate.value = true;
    update();
  }

  void playpause() {
    player().pause();
    playstate.value = false;
    update();
  }

  @override
  void onClose() {
    super.onClose();
    player().dispose();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call(); // 不懂，抄readme的
    update();
  }

  void routechange() {
    routepage.value = (routepage.value + 1) % 2; // 根据页数变化数字
    update();
  }

  void getlocalfile() {
    getsongs().then((value) => ChangeController.to.localmusic.value = value);
  }

  void getsearchres(String key) async { 
    var res = await Dio().get(searchapi + key);
    final json=jsonDecode(res.toString());
    final result = Welcome.fromJson(json);
    searchres.value = result.result.songs;
    hasmore.value = result.result.hasMore;
    searchkey.value = key;
    update();
  }
}

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChangeController>(ChangeController());
  }
}
