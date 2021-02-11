import 'package:flutter/material.dart';
import 'package:flutter_front_end/providers/wsbdb_provider.dart';
import 'package:flutter_front_end/views/display_page.dart';
import 'package:flutter_front_end/widgets/stock_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter_front_end/services/navigation_service.dart';

class LayoutTemplate extends StatefulWidget {
  @override
  _LayoutTemplateState createState() => _LayoutTemplateState();
}

class _LayoutTemplateState extends State<LayoutTemplate> {
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
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: Color(0xFFEEF2F6),
            unselectedIconTheme: IconThemeData(color: Color(0xFF97A0AF)),
            unselectedLabelTextStyle: TextStyle(color: Color(0xFF97A0AF)),
            selectedIconTheme: IconThemeData(color: Color(0xFF216FED)),
            selectedLabelTextStyle: TextStyle(
                color: Color(0xFF216FED), fontWeight: FontWeight.bold),
            elevation: 4,
            leading: Column(
              children: [
                ImageIcon(
                  AssetImage('images/logo.png'),
                  color: Color(0xFF216FED),
                  size: 48,
                ),
                Text(
                  'stock scraper',
                  style: TextStyle(
                      color: Color(0xFF343337),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            groupAlignment: 0.0,
            selectedIndex: _selectedIndex,
            labelType: NavigationRailLabelType.all,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
                _myPage.jumpToPage(index);
              });
            },
            destinations: [
              NavigationRailDestination(
                icon: ImageIcon(
                  AssetImage('images/wallstreetbets.png'),
                ),
                label: Text('r/wallstreetbets'),
              ),
              NavigationRailDestination(
                icon: ImageIcon(
                  AssetImage('images/stocksIcon.png'),
                ),
                label: Text('r/stocks'),
              ),
              NavigationRailDestination(
                icon: ImageIcon(
                  AssetImage('images/investing.png'),
                ),
                label: Text('r/investing'),
              ),
              NavigationRailDestination(
                icon: ImageIcon(
                  AssetImage('images/StockMarketIcon.png'),
                ),
                label: Text('r/StockMarket'),
              ),
              NavigationRailDestination(
                icon: ImageIcon(
                  AssetImage('images/pete_sauce.png'),
                ),
                label: Text('about'),
              ),
            ],
          ),
          //SideMenu(),
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
          // Expanded(
          //   child: _tabs[_selectedIndex],
          // ),
        ],
      ),
    );
  }
}
