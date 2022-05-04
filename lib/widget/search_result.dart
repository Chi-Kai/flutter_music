import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/state_manager.dart';
import 'package:music/config.dart';
import 'package:music/controller/change_controller.dart';
import 'package:music/models/search_result.dart';

class SearchRes extends StatelessWidget {
  SearchRes({Key? key}) : super(key: key);
  final c = ChangeController.to;
  _buildlist(Song s, Size size) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
      /*
      decoration:
          BoxDecoration(border: Border.all(color: Colors.cyan, width: 1),
           borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
      */
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: size.width * 0.7,
                child: Text(s.name,
                    overflow: TextOverflow.ellipsis,
                    style:  TextStyle(
                        color: Colors.green, fontSize: 14)),
              ),
              Text(
                s.artists[0].name,
                style: const TextStyle(color: Colors.blueGrey, fontSize: 12),
              )
            ],
          ),
          // 根据全局的播放ID 和 歌曲ID 决定按钮
          GetBuilder<ChangeController>(
            builder: (_) => c.nowplay == s.id
                ? IconButton(
                    onPressed: () => _onpressfunc(
                        s.id, s.name, s.artists[0].name, s.id.toString()),
                    icon: SvgPicture.asset('assets/icons/start.svg'))
                : IconButton(
                    onPressed: () => _onpressfunc(
                        s.id, s.name, s.artists[0].name, s.id.toString()),
                    icon: SvgPicture.asset('assets/icons/stop.svg')),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.download_sharp),
            iconSize: 30,
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }

  _onpressfunc(int index, String name, String singername, String id) async {
    //final res = await Dio().get(songurlapi + id);
    //Map<String, dynamic> json = jsonDecode(res.toString());
    //final url = json['data'][0]['url'];
    final url = songurlapi + id + ".mp3";
    c.changenetsong(name, singername, url, index);
    c.playerstart();
  }
  /*
  _refresh() async {
    if (c.hasmore.value) {
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GetBuilder<ChangeController>(builder: (_) { // 这样才会更新
      return Expanded(
        // 下拉刷新
          child: RefreshIndicator(
            onRefresh: () async {},
            child: ListView.builder(
                  itemCount: ChangeController.to.searchres.length,
                  itemBuilder: (BuildContext context, int index) {
            final Song s = ChangeController.to.searchres[index];
            return _buildlist(s, size);
                  },
                ),
          ));
    });
  }
}
