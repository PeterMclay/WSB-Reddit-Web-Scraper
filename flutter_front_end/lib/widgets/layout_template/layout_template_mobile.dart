import 'package:flutter/material.dart';
import 'package:flutter_front_end/providers/wsbdb_provider.dart';
import 'package:flutter_front_end/views/display_page.dart';
import 'package:flutter_front_end/widgets/stock_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter_front_end/services/navigation_service.dart';

class LayoutTemplateMobile extends StatefulWidget {
  @override
  _LayoutTemplateMobileState createState() => _LayoutTemplateMobileState();
}

class _LayoutTemplateMobileState extends State<LayoutTemplateMobile> {
  PageController _myPage = PageController(initialPage: 0);
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final wsbProvider = Provider.of<WSBDbProvider>(context);
    final day5Provider = Provider.of<Day5Provider>(context);
    final stocksProvider = Provider.of<StocksDbProvider>(context);
    final stocksTotalProvider = Provider.of<StocksDbTotalProvider>(context);
    final investingProvider = Provider.of<InvestingDbProvider>(context);
    final investingTotalProvider =
        Provider.of<InvestingDbTotalProvider>(context);
    final stockMarketProvider = Provider.of<StockMarketDbProvider>(context);
    final stockMarketTotalProvider =
        Provider.of<StockMarketDbTotalProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xFFF7F9FB),
      appBar: AppBar(
        title: Text(
          'Stock Scraper',
          style: TextStyle(color: Color(0xFF343337)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ImageIcon(
              AssetImage('images/logo.png'),
              color: Color(0xFF216FED),
              size: 48,
            ),
          ),
        ],
        centerTitle: false,
        backgroundColor: Color(0xFFEEF2F6),
        iconTheme: IconThemeData(color: Color(0xFF216FED)),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            //wallstreetbets
            ListTile(
              leading: ImageIcon(
                AssetImage(
                  'images/wallstreetbets.png',
                ),
                color:
                    _selectedIndex == 0 ? Color(0xFF216FED) : Color(0xFF97A0AF),
              ),
              title: Text(
                'r/wallstreetbets',
                style: TextStyle(
                    color: _selectedIndex == 0
                        ? Color(0xFF216FED)
                        : Color(0xFF97A0AF)),
              ),
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                  _myPage.jumpToPage(0);
                });
              },
            ),

            //stocks
            ListTile(
              leading: ImageIcon(
                AssetImage(
                  'images/stocks.png',
                ),
                color:
                    _selectedIndex == 1 ? Color(0xFF216FED) : Color(0xFF97A0AF),
              ),
              title: Text(
                'r/stocks',
                style: TextStyle(
                    color: _selectedIndex == 1
                        ? Color(0xFF216FED)
                        : Color(0xFF97A0AF)),
              ),
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                  _myPage.jumpToPage(1);
                });
              },
            ),

            //investing
            ListTile(
              leading: ImageIcon(
                AssetImage(
                  'images/investing.png',
                ),
                color:
                    _selectedIndex == 2 ? Color(0xFF216FED) : Color(0xFF97A0AF),
              ),
              title: Text(
                'r/investing',
                style: TextStyle(
                    color: _selectedIndex == 2
                        ? Color(0xFF216FED)
                        : Color(0xFF97A0AF)),
              ),
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                  _myPage.jumpToPage(2);
                });
              },
            ),

            //StockMarket
            ListTile(
              leading: ImageIcon(
                AssetImage(
                  'images/StockMarket.png',
                ),
                color:
                    _selectedIndex == 3 ? Color(0xFF216FED) : Color(0xFF97A0AF),
              ),
              title: Text(
                'r/StockMarket',
                style: TextStyle(
                    color: _selectedIndex == 3
                        ? Color(0xFF216FED)
                        : Color(0xFF97A0AF)),
              ),
              onTap: () {
                setState(() {
                  _selectedIndex = 3;
                  _myPage.jumpToPage(3);
                });
              },
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _myPage,
              children: [
                StreamBuilder(
                  stream: wsbProvider.entries,
                  builder: (context, snapshot1) {
                    return StreamBuilder(
                      stream: day5Provider.entries,
                      builder: (context, snapshot2) {
                        if (snapshot1.connectionState ==
                                ConnectionState.waiting ||
                            snapshot2.connectionState ==
                                ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return DispalyPage(
                          day0: snapshot1.data.stockMap,
                          day5Total: snapshot2.data.stockMap,
                          day0Comments: snapshot1.data.totalComments,
                          day5TotalComments: snapshot2.data.totalComments,
                          title: 'wallstreetbets',
                        );
                      },
                    );
                  },
                ),
                StreamBuilder(
                  stream: stocksProvider.entries,
                  builder: (context, snapshot1) {
                    return StreamBuilder(
                      stream: stocksTotalProvider.entries,
                      builder: (context, snapshot2) {
                        if (snapshot1.connectionState ==
                                ConnectionState.waiting ||
                            snapshot2.connectionState ==
                                ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return DispalyPage(
                          day0: snapshot1.data.stockMap,
                          day5Total: snapshot2.data.stockMap,
                          day0Comments: snapshot1.data.totalComments,
                          day5TotalComments: snapshot2.data.totalComments,
                          title: 'stocks',
                        );
                      },
                    );
                  },
                ),
                StreamBuilder(
                  stream: investingProvider.entries,
                  builder: (context, snapshot1) {
                    return StreamBuilder(
                      stream: investingTotalProvider.entries,
                      builder: (context, snapshot2) {
                        if (snapshot1.connectionState ==
                                ConnectionState.waiting ||
                            snapshot2.connectionState ==
                                ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return DispalyPage(
                          day0: snapshot1.data.stockMap,
                          day5Total: snapshot2.data.stockMap,
                          day0Comments: snapshot1.data.totalComments,
                          day5TotalComments: snapshot2.data.totalComments,
                          title: 'investing',
                        );
                      },
                    );
                  },
                ),
                StreamBuilder(
                  stream: stockMarketProvider.entries,
                  builder: (context, snapshot1) {
                    return StreamBuilder(
                      stream: stockMarketTotalProvider.entries,
                      builder: (context, snapshot2) {
                        if (snapshot1.connectionState ==
                                ConnectionState.waiting ||
                            snapshot2.connectionState ==
                                ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return DispalyPage(
                          day0: snapshot1.data.stockMap,
                          day5Total: snapshot2.data.stockMap,
                          day0Comments: snapshot1.data.totalComments,
                          day5TotalComments: snapshot2.data.totalComments,
                          title: 'StockMarket',
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
