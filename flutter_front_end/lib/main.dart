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
        home: HomeView(),
      ),
    );
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

          Expanded(
            child: StreamBuilder(
              stream: isSelected[0] == true
                  ? wsbProvider.entries
                  : day5Provider.entries,
              builder: (context, snapshot) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    dataRowHeight: 32.0,
                    columns: [
                      DataColumn(label: Text('Stock')),
                      DataColumn(label: Text('Mentions')),
                    ],
                    rows: snapshot.data.stockMap.entries
                        .map<DataRow>((e) => DataRow(cells: [
                              DataCell(Text(e.key.toString())),
                              DataCell(Text(e.value.toString())),
                            ]))
                        .toList(),
                  ),
                );
              },
            ),
          ),

          // StreamBuilder(
          //   stream: isSelected[0] == true
          //       ? wsbProvider.entries
          //       : day5Provider.entries,
          //   builder: (context, snapshot) {
          //     return Expanded(
          //       child: ListView.builder(
          //         itemCount: 100,
          //         itemBuilder: (context, index) {
          //           String key = snapshot.data.stockMap.keys.elementAt(index);
          //           return Column(
          //             children: <Widget>[
          //               ListTile(
          //                 title: Text("$key"),
          //                 subtitle: Text("${snapshot.data.stockMap[key]}"),
          //               ),
          //               Divider(
          //                 height: 2.0,
          //               ),
          //             ],
          //           );
          //         },
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
