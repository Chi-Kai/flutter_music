import 'package:flutter/material.dart';
import 'package:music/controller/change_controller.dart';
import 'package:music/widget/home_bottom.dart';
import 'package:music/widget/search_appbar.dart';
import 'package:music/widget/search_result.dart';

class NetBody extends StatelessWidget {
  const NetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: <Widget>[SearchRes(),const HomeBottom()],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.blueGrey,
      toolbarHeight: 60,
      leading: IconButton(
          onPressed: () => ChangeController.to.toggleDrawer(),
          icon: const Icon(Icons.align_horizontal_left_rounded)),
      title: const SearchAppbar(),
    );
  }
}
