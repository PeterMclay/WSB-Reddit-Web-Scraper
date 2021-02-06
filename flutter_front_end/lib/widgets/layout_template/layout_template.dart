import 'package:flutter/material.dart';
import 'package:flutter_front_end/locator.dart';
import 'package:flutter_front_end/routing/route_names.dart';
import 'package:flutter_front_end/routing/router.dart';
import 'package:flutter_front_end/widgets/side_menu/side_menu.dart';
import 'package:flutter_front_end/services/navigation_service.dart';

class LayoutTemplate extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _key,
      body: Row(
        children: [
          SideMenu(),
          Expanded(
            child: Navigator(
              key: locator<NavigationService>().navigatorKey,
              onGenerateRoute: generateRoute,
              initialRoute: StockListRoute,
            ),
          ),
        ],
      ),
    );
  }
}
