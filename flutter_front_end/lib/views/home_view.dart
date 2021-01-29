import 'package:flutter/material.dart';
import 'package:flutter_front_end/widgets/navigation_bar.dart';
import 'package:flutter_front_end/widgets/centered_view.dart';
import 'package:flutter_front_end/widgets/stock_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
        child: Column(
          children: <Widget>[
            NavigationBar(),
            Expanded(child: StockList()),
          ],
        ),
      ),
    );
  }
}
