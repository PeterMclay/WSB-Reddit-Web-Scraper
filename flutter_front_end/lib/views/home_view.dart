import 'package:flutter/material.dart';
import 'package:flutter_front_end/widgets/navigation_bar.dart';
import 'package:flutter_front_end/widgets/centered_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
        child: Column(
          children: <Widget>[
            NavigationBar(),
          ],
        ),
      ),
    );
  }
}
