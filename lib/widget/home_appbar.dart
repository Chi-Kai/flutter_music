import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:music/controller/change_controller.dart';
import 'package:marquee/marquee.dart';

class Bar extends StatelessWidget {
  const Bar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: IconButton(
            onPressed: () => ChangeController.to.toggleDrawer(),
            icon: const Icon(Icons.align_horizontal_left_rounded),
            iconSize: 35,
            color: Colors.grey,
          ),
        ),
        Container(
          height: size.height * 0.4,
          width: size.width * 0.7,
          padding: EdgeInsets.only(top: size.height * 0.25), //调节子节点位置
          alignment: Alignment.center, //控制子节点对齐方式
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                  bottomRight: Radius.circular(150)),
              image: DecorationImage(
                  image: AssetImage("assets/images/1.jpg"),
                  fit: BoxFit.fitWidth)),
          child: Column(
            children: <Widget>[
              Obx(() => SizedBox(
                    width: 140,
                    height: 30,
                    child: AutoSizeText(
                      ChangeController.to.musicName.value,
                      minFontSize: 25,
                      maxFontSize: 25,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w600),
                      overflowReplacement: Marquee(
                        text: ChangeController.to.musicName.value,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600),
                        blankSpace: 50,
                      ),
                    ),
                  )),
              GetBuilder<ChangeController>(
                init: ChangeController(),
                builder: (_) => Text(_.singer.value,
                    //scrollAxis: Axis.horizontal,
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.w400)),
              ),
            ],
          ),
        ), // 绘制圆头柱形
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz_rounded),
            iconSize: 35,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
