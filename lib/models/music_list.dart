import 'dart:io';

import 'package:just_audio/just_audio.dart';
import 'package:music/config.dart';
import 'package:music/controller/file_controller.dart';
import 'package:path/path.dart' as p;

class Music {
  String name;
  String singer;
  String time;
  String path;
  Music(
      {required this.name,
      required this.singer,
      required this.time,
      required this.path});
}

List<Music> musics = [
  Music(name: 'Don\'t be lazy', singer: 'lazy', time: '3.50', path: ''),
  Music(name: 'Industry Boby', singer: 'lazy1', time: '2.30', path: ''),
  Music(name: 'Crazy people', singer: 'lazy2', time: '4.30', path: ''),
  Music(name: 'I Love you 3000', singer: 'lazy3', time: '3.22', path: ''),
  Music(name: 'Don\'t be like that', singer: 'lazy4', time: '5.14', path: ''),
  Music(name: 'Don\'t be like that', singer: 'lazy4', time: '5.14', path: ''),
  Music(name: 'Don\'t be like that', singer: 'lazy4', time: '5.14', path: ''),
  Music(name: 'Don\'t be like that', singer: 'lazy4', time: '5.14', path: ''),
];

Future<List<Music>> getsongs() async {
  List<FileSystemEntity> files = [];
  AudioPlayer player = AudioPlayer();
  List<Music> songs = [];
  await getDirByName(filedir).then((value) => files = value);

  for (var item in files) {
    String path = item.path;
    if (p.extension(path) == '.mp3') {
      Music tmp =
          Music(name: p.basename(path), singer: '', time: '2.0', path: path);
      try {
        await player
            .setFilePath(path)
            .then((value) => tmp.time = value.toString().substring(2, 7));
      } catch (e) {
        tmp.time = '';
      } // 求得播放时间
      songs.add(tmp);
    }
  }
  return songs;
}
