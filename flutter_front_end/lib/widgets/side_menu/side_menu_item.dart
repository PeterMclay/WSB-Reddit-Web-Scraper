import 'package:flutter/material.dart';
import 'package:flutter_front_end/widgets/custom_text.dart';

class SideMenuItemDesktop extends StatelessWidget {
  final bool active;
  final String text;
  final String imageName;
  final Function onTap;

  const SideMenuItemDesktop(
      {Key key, this.active, this.text, this.imageName, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: null,
      leading: Image.asset(imageName),
      title: CustomText(
        text: text,
        color: Colors.white,
        size: active ? 20 : 18,
        weight: active ? FontWeight.bold : FontWeight.w300,
      ),
    );
  }
}
