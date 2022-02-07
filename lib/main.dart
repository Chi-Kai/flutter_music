import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:music/config.dart';
import 'package:music/controller/change_controller.dart';
import 'package:music/controller/file_controller.dart';
import 'package:music/screen/home_screen.dart';

void main() {
  UsersBinding().dependencies();
  runApp(const MyApp());
  if (Platform.isAndroid) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: [SystemUiOverlay.bottom]);
  }
  // 创建本地文件夹
  createFolderInAppDocDir(filedir);
  //getDirByName('music');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Music",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home:  const HomeScreen(),
    );
  }

}
