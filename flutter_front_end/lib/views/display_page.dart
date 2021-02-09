import 'package:flutter/material.dart';
import 'package:flutter_front_end/models/constants.dart';
import 'package:flutter_front_end/widgets/send_tendies.dart';
import 'package:intl/intl.dart';

class DispalyPage extends StatefulWidget {
  final Map day0, day5Total;
  final String day0Comments, day5TotalComments, title;
  DispalyPage(
      {this.day0,
      this.day5Total,
      this.day0Comments,
      this.day5TotalComments,
      this.title});
  @override
  _DispalyPageState createState() => _DispalyPageState();
}

class _DispalyPageState extends State<DispalyPage> {
  List<bool> isSelected = [true, false];
  String today;
  String yesterday;
  String dayResults, day5Results;

  @override
  void initState() {
    timeFunc(isSelected[0]);
    print(today);
    print(yesterday);
    super.initState();
  }

  void timeFunc(bool day5) {
    DateTime hourCheck = DateTime.now();
    var formatterHourCheck = DateFormat('H');
    var formatter = DateFormat('MMM d');
    String formattedHourChecker = formatterHourCheck.format(hourCheck);
    int intDate = int.parse(formattedHourChecker);
    if (intDate < 12) {
      int x, y;
      if (day5) {
        x = 1;
        y = 2;
      } else {
        x = 1;
        y = 7;
      }
      DateTime _now = DateTime.now().subtract(Duration(days: x));
      DateTime _yesterday = DateTime.now().subtract(Duration(days: y));
      today = formatter.format(_now);
      yesterday = formatter.format(_yesterday);
      dayResults = '24 hour results from 7am $yesterday to 7am $today ETC';
      day5Results = '5 day results from 7am $yesterday to 7am $today ETC';
    } else {
      int y;
      if (day5) {
        y = 1;
      } else {
        y = 6;
      }
      DateTime _now = DateTime.now();
      DateTime _yesterday = DateTime.now().subtract(Duration(days: y));
      today = formatter.format(_now);
      yesterday = formatter.format(_yesterday);
      dayResults = '24 hour results from 7am $yesterday to 7am $today ETC';
      day5Results = '5 day results from 7am $yesterday to 7am $today ETC';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset('images/${widget.title}.png',
                  scale: widget.title == 'wallstreetbets' ||
                          widget.title == 'investing'
                      ? 2
                      : 4),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'r/${widget.title}',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF343337),
                    ),
                  ),
                  Text(
                    '${isSelected[0] ? widget.day0Comments : widget.day5TotalComments} Comments Parsed',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text('${isSelected[0] ? dayResults : day5Results}'),
                ],
              ),
            ],
          ),
          Center(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleButtons(
                      constraints: BoxConstraints(minHeight: 16),
                      selectedColor: Color(0xFF216FED),
                      fillColor: Color(0xFFF7F9FB),
                      renderBorder: false,
                      children: <Widget>[
                        Text('24 Hour'),
                        Text('  5 Day'),
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
                          timeFunc(isSelected[0]);
                        });
                      },
                      isSelected: isSelected,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 16.0),
                  padding: EdgeInsets.all(0),
                  constraints: BoxConstraints(
                    maxHeight: 750,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)),
                    //margin: EdgeInsets.symmetric(vertical: 24.0),
                    elevation: 2,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        headingTextStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF343337),
                            fontWeight: FontWeight.bold),
                        columns: [
                          DataColumn(label: Text('Symbol')),
                          DataColumn(label: Text('Company')),
                          DataColumn(label: Text('Mentions')),
                        ],
                        rows: isSelected[0]
                            ? widget.day0.entries
                                .map(
                                  (e) => DataRow(
                                    cells: [
                                      DataCell(Text(e.key.toString())),
                                      DataCell(Text(
                                          stocksCompany[e.key.toString()]
                                              .toString())),
                                      DataCell(Text(e.value.toString())),
                                    ],
                                  ),
                                )
                                .toList()
                            : widget.day5Total.entries
                                .map(
                                  (e) => DataRow(
                                    cells: [
                                      DataCell(Text(e.key.toString())),
                                      DataCell(Text(
                                          stocksCompany[e.key.toString()]
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
          ),
          Center(
            child: SendTendies(),
          ),
        ],
      ),
    );
  }
}
