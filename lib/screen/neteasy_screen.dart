import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:music/controller/change_controller.dart';
import 'package:music/widget/drawer.dart';
import 'package:music/widget/net_body.dart';

class NetScreen extends StatefulWidget {
  const NetScreen({Key? key}) : super(key: key);

  @override
  _NetScreenState createState() => _NetScreenState();
}

class _NetScreenState extends State<NetScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangeController>(
        builder: (_) => ZoomDrawer(
              menuScreen: const MenuScreen(),
              mainScreen: const NetBody(),
              controller: _.zoomDrawerController,
              borderRadius: 24,
              showShadow: true,
              angle: -12.0,
              backgroundColor: Colors.grey,
              slideWidth: MediaQuery.of(context).size.width * 0.4,
            ));
  }
}
