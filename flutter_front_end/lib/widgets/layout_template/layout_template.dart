import 'package:flutter/material.dart';
import 'package:flutter_front_end/providers/wsbdb_provider.dart';
import 'package:flutter_front_end/views/display_page.dart';
import 'package:flutter_front_end/widgets/stock_list.dart';
import 'package:flutter_front_end/locator.dart';
//import 'package:flutter_front_end/routing/route_names.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_front_end/routing/router.dart';
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
      backgroundColor: Colors.white,
      body: Row(
        children: [
          NavigationRail(
            elevation: 1,
            leading: Text('stock scraper'),
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
                  AssetImage('images/wsb.png'),
                ),
                label: Text('r/wallstreetbets'),
              ),
              NavigationRailDestination(
                icon: ImageIcon(
                  AssetImage('images/stocks.png'),
                ),
                label: Text('r/stocks'),
              ),
              NavigationRailDestination(
                icon: ImageIcon(
                  AssetImage('images/stonks.png'),
                ),
                label: Text('r/investing'),
              ),
              NavigationRailDestination(
                icon: ImageIcon(
                  AssetImage('images/StockMarket.png'),
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
                        return Expanded(
                          child: DispalyPage(
                              day0: snapshot1.data.stockMap,
                              day5Total: snapshot2.data.stockMap,
                              day0Comments: snapshot1.data.totalComments,
                              day5TotalComments: snapshot2.data.totalComments),
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
                        return Expanded(
                          child: DispalyPage(
                              day0: snapshot1.data.stockMap,
                              day5Total: snapshot2.data.stockMap,
                              day0Comments: snapshot1.data.totalComments,
                              day5TotalComments: snapshot2.data.totalComments),
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
                        return Expanded(
                          child: DispalyPage(
                              day0: snapshot1.data.stockMap,
                              day5Total: snapshot2.data.stockMap,
                              day0Comments: snapshot1.data.totalComments,
                              day5TotalComments: snapshot2.data.totalComments),
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
                        return Expanded(
                          child: DispalyPage(
                              day0: snapshot1.data.stockMap,
                              day5Total: snapshot2.data.stockMap,
                              day0Comments: snapshot1.data.totalComments,
                              day5TotalComments: snapshot2.data.totalComments),
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
