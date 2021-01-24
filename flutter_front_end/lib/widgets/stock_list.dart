import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:collection';

class StockList extends StatefulWidget {
  @override
  _StockListState createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  CollectionReference wsbDB = FirebaseFirestore.instance.collection('WSB');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: wsbDB.doc('day0').get(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> dict = snapshot.data.data();
          Map<String, dynamic> sortedM = Map.fromEntries(dict.entries.toList()
            ..sort((e1, e2) => e2.value.compareTo(e1.value)));
          return StockTable(sortedM);
        }
        return Text("loading");
      },
    );
  }
}

class StockTable extends StatefulWidget {
  final Map data;
  StockTable(this.data);
  @override
  _StockTableState createState() => _StockTableState();
}

class _StockTableState extends State<StockTable> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            dataRowHeight: 32.0,
            columns: [
              DataColumn(label: Text('Stock')),
              DataColumn(label: Text('Mentions')),
            ],
            rows: widget.data.entries
                .map((e) => DataRow(cells: [
                      DataCell(Text(e.key.toString())),
                      DataCell(Text(e.value.toString())),
                    ]))
                .toList(),
          ),
        ),
      ],
    );
  }
}
