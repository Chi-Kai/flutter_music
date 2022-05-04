import 'package:flutter/material.dart';
import 'package:music/controller/change_controller.dart';
import 'package:music/screen/about_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: const Color.fromARGB(255, 117, 132, 218),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DrawerRow(
            icon: Icons.autorenew,
            text: 'Toggle',
            func: ()=>_toggletap(context),
          ),
          DrawerRow(
            icon: Icons.cloud_upload_outlined,
            text: 'Upload',
            func: () {},
          ),
          DrawerRow(
            icon: Icons.settings_outlined,
            text: 'Setting',
            func: () {},
          ),
          DrawerRow(
            icon: Icons.help_outline,
            text: 'Help',
            func: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AboutScreen())),
          ),
        ],
      ),
    );
  }
}

_toggletap(BuildContext context ) { 
  if (ChangeController.to.routepage.value == 0) {
     ChangeController.to.routechange();
     Navigator.of(context)   
    .pushNamedAndRemoveUntil('/netscreen', (Route<dynamic> route) => false);
  
  }  else if (ChangeController.to.routepage.value == 1) {
     ChangeController.to.routechange();
     Navigator.of(context)
    .pushNamedAndRemoveUntil('/localscreen', (Route<dynamic> route) => false);
  }

}

class DrawerRow extends StatelessWidget {
  const DrawerRow({
    Key? key,
    required this.icon,
    required this.text,
    required this.func,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Function func;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => func(),
      child: Container(
        padding: EdgeInsets.only(top: size.height * 0.05),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
              size: 35,
            ),
            SizedBox(
              width: size.width * 0.06,
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none, // 删除下划线
              ),
            )
          ],
        ),
      ),
    );
  }
}
