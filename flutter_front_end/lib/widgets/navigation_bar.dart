import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.blue[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'r/StockScraper',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _NavBarItem('About'),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  _NavBarItem(this.title);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        'About',
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
      onPressed: () {},
    );
  }
}
