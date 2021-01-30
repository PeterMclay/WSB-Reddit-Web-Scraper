import 'package:flutter/material.dart';
import 'package:flutter_front_end/widgets/side_menu/side_menu_item.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.indigo,
          gradient: LinearGradient(
            colors: [Colors.indigo, Colors.indigo.shade600],
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[200], offset: Offset(3, 5), blurRadius: 17)
          ]),
      width: 200,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SideMenuItemDesktop(
              active: true,
              text: 'r/wallstreetbets',
              imageName: 'images/wsb.png',
              onTap: () {},
            ),
            SideMenuItemDesktop(
              active: false,
              text: 'r/stocks',
              imageName: 'images/stocks.png',
              onTap: () {},
            ),
            SideMenuItemDesktop(
              active: false,
              text: 'r/investing',
              imageName: 'images/stonks.png',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
