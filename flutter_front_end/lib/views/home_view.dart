import 'package:flutter/material.dart';
import 'package:flutter_front_end/widgets/navigation_bar.dart';
import 'package:flutter_front_end/widgets/centered_view.dart';
import 'package:flutter_front_end/widgets/stock_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeView extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
        child: Column(
          children: <Widget>[
            NavigationBar(),
            FutureBuilder(
              // Initialize FlutterFire:
              future: _initialization,
              builder: (context, snapshot) {
                // Check for errors
                if (snapshot.hasError) {
                  return Center(child: Text('Error'));
                }

                // Once complete, show your application
                if (snapshot.connectionState == ConnectionState.done) {
                  return Expanded(
                    child: StockList(),
                  );
                }

                // Otherwise, show something whilst waiting for initialization to complete
                return Center(child: Text('Error'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
