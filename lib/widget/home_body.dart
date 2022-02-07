import 'package:flutter/material.dart';
import 'package:music/widget/home_appbar.dart';
import 'package:music/widget/home_bottom.dart';
import 'package:music/widget/home_listview.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 必须包含，补全结构
      body: Container(
        color: const Color(0xffeff0f1),
        child: Column(
          children: const <Widget>[Bar(), MusicList(), HomeBottom()],
        ),
      ),
    );
  }
}
