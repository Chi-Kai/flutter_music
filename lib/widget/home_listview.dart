import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music/controller/change_controller.dart';
import 'package:get/get.dart';
import 'package:music/models/music_list.dart';

class MusicList extends StatefulWidget {
  const MusicList({Key? key}) : super(key: key);

  @override
  _MusicListState createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  //bool hasmusic = false; //是否有音乐正在播放
  static int nowplay = -1; // 正在播放的音乐id  使用静态，切换页面后还保持
  List<Music> songs = [];
  final c = Get.put(ChangeController());

  @override
  void initState() {
    super.initState();
    getsongs().then((value) {
      setState(() {
        songs = value;
      });
    });
  }
  @override
  void reassemble(){
    super.reassemble();
    print(ChangeController.to.player.value.playerState.processingState);
  }

  _buildlist(BuildContext context, Music music, int index) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              nowplay == index
                  ? IconButton(
                      onPressed: () => _onpressfunc(
                          index, music.name, music.singer, music.path),
                      icon: SvgPicture.asset('assets/icons/start.svg'))
                  : IconButton(
                      onPressed: () => _onpressfunc(
                          index, music.name, music.singer, music.path),
                      icon: SvgPicture.asset('assets/icons/stop.svg')),
              SizedBox(
                width: 150,
                child: Text(
                  music.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: nowplay == index ? Colors.black : Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              nowplay == index
                  ? IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/icons/Sound_wave.svg'),
                    )
                  : const SizedBox.shrink() //占位
            ],
          ),
          Text(
            music.time,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: nowplay == index ? Colors.black : Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

// 每次只能有一个播放
  _onpressfunc(int index, String name, String singername, String path) {
    // flutter 的 类是引用传递的
    setState(() {
      nowplay = index;
      c.changeName(name, singername, path);
      c.playerstart();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (BuildContext context, int index) {
          final Music music = songs[index];
          return _buildlist(context, music, index);
        },
      ),
    );
  }
}
