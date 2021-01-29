import 'package:flutter/material.dart';
import 'package:flutter_front_end/providers/wsbdb_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'views/home_view.dart';
import 'package:flutter_front_end/services/database.dart';
import 'package:flutter_front_end/models/wsbdb.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WSBDbProvider(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wsbProvider = Provider.of<WSBDbProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: StreamBuilder<WSBDb>(
          stream: wsbProvider.entries,
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.stockMap.length,
              itemBuilder: (context, index) {
                String key = snapshot.data.stockMap.keys.elementAt(index);
                return Column(
                  children: <Widget>[
                    ListTile(
                      title: Text("$key"),
                      subtitle: Text("${snapshot.data.stockMap[key]}"),
                    ),
                    Divider(
                      height: 2.0,
                    ),
                  ],
                );
              },
            );
          }),
    );
  }
}
