import 'package:flutter/material.dart';
import 'package:flutter_front_end/providers/wsbdb_provider.dart';
import 'package:provider/provider.dart';

class StockList extends StatefulWidget {
  @override
  _StockListState createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  List<bool> isSelected = [true, false];
  bool sort = false;
  @override
  Widget build(BuildContext context) {
    final wsbProvider = Provider.of<WSBDbProvider>(context);
    final day5Provider = Provider.of<Day5Provider>(context);
    return Column(
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
                  headingTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  //dataRowHeight: 32.0,
                  columns: [
                    DataColumn(label: Text('Symbol')),
                    DataColumn(label: Text('Company')),
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
      ],
    );
  }
}
