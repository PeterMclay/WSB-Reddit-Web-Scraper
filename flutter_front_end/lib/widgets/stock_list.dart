import 'package:flutter/material.dart';
import 'package:flutter_front_end/models/constants.dart';
import 'package:flutter_front_end/providers/wsbdb_provider.dart';
import 'package:provider/provider.dart';

class StockList extends StatefulWidget {
  @override
  _StockListState createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    final wsbProvider = Provider.of<WSBDbProvider>(context);
    final day5Provider = Provider.of<Day5Provider>(context);
    return StreamBuilder(
        stream:
            isSelected[0] == true ? wsbProvider.entries : day5Provider.entries,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              //mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'r/wallstreetbets',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                Text(snapshot.data.totalComments),
                Text('From Jan 30 7am - Jan 31 7am 2021'),
                ToggleButtons(
                  constraints: BoxConstraints(minHeight: 36, minWidth: 36),
                  selectedColor: Colors.blue,
                  fillColor: Colors.white,
                  selectedBorderColor: Colors.blue,
                  renderBorder: false,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('24 Hour Total'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('5 Day Total'),
                    ),
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
                Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(0),
                  constraints: BoxConstraints(
                    maxHeight: 700,
                  ),
                  child: Card(
                    elevation: 1,
                    shadowColor: Colors.black,
                    clipBehavior: Clip.none,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        headingTextStyle:
                            TextStyle(fontWeight: FontWeight.bold),
                        columns: [
                          DataColumn(label: Text('Symbol')),
                          DataColumn(label: Text('Company')),
                          DataColumn(label: Text('Mentions')),
                        ],
                        rows: snapshot.data.stockMap.entries
                            .map<DataRow>(
                              (e) => DataRow(
                                cells: [
                                  DataCell(Text(e.key.toString())),
                                  DataCell(Text(stocksCompany[e.key.toString()]
                                      .toString())),
                                  DataCell(Text(e.value.toString())),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
