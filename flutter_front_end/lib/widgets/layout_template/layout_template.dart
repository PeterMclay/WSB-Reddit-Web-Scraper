import 'package:flutter/material.dart';
import 'package:flutter_front_end/widgets/stock_list.dart';
import 'package:flutter_front_end/locator.dart';
import 'package:flutter_front_end/routing/route_names.dart';
import 'package:flutter_front_end/providers/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_front_end/routing/router.dart';
import 'package:flutter_front_end/widgets/side_menu/side_menu.dart';
import 'package:flutter_front_end/services/navigation_service.dart';
import 'package:flutter_front_end/helpers/enumerators.dart';

class LayoutTemplate extends StatefulWidget {
  @override
  _LayoutTemplateState createState() => _LayoutTemplateState();
}

class _LayoutTemplateState extends State<LayoutTemplate> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final _tabs = [StockList(), StockList(), Text('hello')];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _key,
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
            child: _tabs[_selectedIndex],
            // child: Navigator(
            //   key: locator<NavigationService>().navigatorKey,
            //   onGenerateRoute: generateRoute,
            //   initialRoute: StockListRoute,
            // ),
          ),
        ],
      ),
    );
  }
}
