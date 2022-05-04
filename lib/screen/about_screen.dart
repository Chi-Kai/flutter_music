import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:const <Widget>[
            Text(
              '一款自定义的音乐播放器',
              style: TextStyle(fontSize: 30,color: Colors.blue),
            ),
            // 填充
            SizedBox(height: 20,),    
            Text(
              'code by Red-K',
              style: TextStyle(fontSize: 20,color: Colors.green),
            ),
            SizedBox(height: 20,),    
            Text(
              'Github: Chi-Kai/flutter_music',
              style: TextStyle(fontSize: 20,color: Colors.red),
            ),
            SizedBox(height: 20,),    
            Text(
              '版本号: 1.0.0',
              style: TextStyle(fontSize: 10),
            ),
          ]),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.blueGrey,
      title: const Text('About'),
      
    );
  }
}
