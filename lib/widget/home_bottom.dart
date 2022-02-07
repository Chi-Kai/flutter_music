import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/state_manager.dart';
import 'package:just_audio/just_audio.dart';
import 'package:marquee/marquee.dart';
import 'package:music/controller/change_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomeBottom extends StatefulWidget {
  const HomeBottom({Key? key}) : super(key: key);

  @override
  _HomeBottomState createState() => _HomeBottomState();
}

class _HomeBottomState extends State<HomeBottom> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding:
            EdgeInsets.only(top: size.height * 0.02, left: size.width * 0.06),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon:
                        SvgPicture.asset('assets/icons/arrow-ios-upward.svg')),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Obx(() => SizedBox(
                          width: 180,
                          height: 20,
                          child: AutoSizeText(
                            ChangeController.to.musicName.value,
                            style: const TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            overflowReplacement: Marquee(
                              text: ChangeController.to.musicName.value,
                              blankSpace: 100,
                              scrollAxis: Axis.horizontal,
                              style: const TextStyle(
                                  color: Colors.teal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        )),
                    GetBuilder<ChangeController>(
                      init: ChangeController(),
                      builder: (_) => Text(
                        _.singer.value,
                        style: const TextStyle(
                            color: Colors.black45,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: size.width * 0.05),
              child: GestureDetector(
                onTap: () => _onTapfunc(),
                child: SizedBox(
                    height: 50,
                    width: 50,
                    child: GetBuilder<ChangeController>(
                      builder: (_) =>
                          _.player.value.playerState.processingState !=
                                      ProcessingState.completed &&
                                  _.playstate.value
                              ? SvgPicture.asset(
                                  'assets/icons/playing.svg',
                                )
                              : SvgPicture.asset('assets/icons/stoping.svg'),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onTapfunc() {
    setState(() {
      if (ChangeController.to.player().playerState.processingState !=
          ProcessingState.completed && ChangeController.to.playstate.value) { // 两个变量为了实现播放完改变符号和切换状态的功能
        ChangeController.to.playpause();
      } else {
        ChangeController.to.playerstart();
      }
    });
  }
}
