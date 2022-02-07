import 'package:flutter/material.dart';

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
        children: const <Widget>[
          DrawerRow(
            icon: Icons.autorenew,
            text: 'Toggle',
          ),
          DrawerRow(
            icon: Icons.cloud_upload_outlined,
            text: 'Upload',
          ),
          DrawerRow(icon: Icons.settings_outlined, text: 'Setting'),
          DrawerRow(
            icon: Icons.help_outline,
            text: 'Help',
          ),
          DrawerRow(
            icon: Icons.error_outline,
            text: 'About',
          )
        ],
      ),
    );
  }
}

class DrawerRow extends StatelessWidget {
  const DrawerRow({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
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
    );
  }
}
