import 'package:flutter/material.dart';
import 'package:flutter_front_end/models/constants.dart';
import 'package:buy_me_a_coffee_widget/buy_me_a_coffee_widget.dart';

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
                    'Comments Parsed: ${isSelected[0] ? widget.day0Comments : widget.day5TotalComments}',
                  ),
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
                        });
                      },
                      isSelected: isSelected,
                    ),
                  ],
                ),
                Container(
                  //margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(0),
                  constraints: BoxConstraints(
                    maxHeight: 750,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)),
                    //margin: EdgeInsets.symmetric(vertical: 24.0),
                    elevation: 2,
                    shadowColor: Colors.black,
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
            child: Container(
              width: 55.0,
              child: BuyMeACoffeeWidget(
                sponsorID: "petermclay",
                theme: YellowTheme(),
                customText: '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
