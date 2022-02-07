import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class ChangeController extends GetxController {
  static ChangeController get to => Get.find();
  var musicName = 'Select Your Music'.obs;
  var singer = ''.obs;
  var nowplay = -1.obs;
  //var nowmusic = Music(name: 'Select Your Music',singer: '',path: '',time: '').obs; // 试过用类，有问题
  var playstate = false.obs;
  var player = AudioPlayer().obs;
  final zoomDrawerController = ZoomDrawerController(); // 侧边栏控制器
  
  void changeName(String name, String singername,String path) {
    musicName.value = name;  
    singer.value = singername;
    //nowplay = index; 
    //nowmusic.value.name = name;
    //nowmusic.value.singer = singername;
    // 有问题
    player().setFilePath(path);
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
}

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChangeController>(ChangeController());
  }
}
