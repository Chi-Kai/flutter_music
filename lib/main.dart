import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:music/config.dart';
import 'package:music/controller/change_controller.dart';
import 'package:music/controller/file_controller.dart';
import 'package:music/screen/home_screen.dart';
import 'package:music/screen/neteasy_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  UsersBinding().dependencies();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // 启动页面
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  // 检测平台是否是android
  if (Platform.isAndroid) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }
  FlutterNativeSplash.remove();
  // 创建本地文件夹
  createFolderInAppDocDir(filedir);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Music",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const HomeScreen(),
      routes: {
        '/netscreen': (context) => const NetScreen(),
        '/localscreen': (context) => const HomeScreen(),
      },
    );
  }
}
