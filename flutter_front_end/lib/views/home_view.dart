import 'package:flutter/material.dart';
import 'package:flutter_front_end/widgets/navigation_bar.dart';
import 'package:flutter_front_end/widgets/centered_view.dart';
import 'package:flutter_front_end/widgets/side_menu/side_menu.dart';
import 'package:flutter_front_end/widgets/stock_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          SideMenu(),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'r/wallstreetbets',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Expanded(child: StockList()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
