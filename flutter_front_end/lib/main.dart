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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WSBDbProvider>(
            create: (context) => WSBDbProvider()),
        ChangeNotifierProvider<Day5Provider>(
            create: (context) => Day5Provider()),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
    // return ChangeNotifierProvider(
    //   create: (context) => WSBDbProvider(),
    //   child: MaterialApp(
    //     home: HomeScreen(),
    //   ),
    // );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    final wsbProvider = Provider.of<WSBDbProvider>(context);
    final day5Provider = Provider.of<Day5Provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Column(
        children: [
          ToggleButtons(
            children: <Widget>[
              Text('24 Hour Total'),
              Text('5 Day Total'),
            ],
            onPressed: (int index) {
              setState(() {
                for (int buttonIndex = 0;
                    buttonIndex < isSelected.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    isSelected[buttonIndex] = true;
                  } else {
                    isSelected[buttonIndex] = false;
                  }
                }
              });
            },
            isSelected: isSelected,
          ),
          StreamBuilder(
              stream: isSelected[0] == true
                  ? wsbProvider.entries
                  : day5Provider.entries,
              builder: (context, snapshot) {
                return Expanded(
                  child: ListView.builder(
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
                  ),
                );
              }),
        ],
      ),
    );
  }
}
