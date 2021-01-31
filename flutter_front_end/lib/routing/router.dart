import 'package:flutter/material.dart';
import 'package:flutter_front_end/widgets/stock_list.dart';
import 'package:flutter_front_end/routing/route_names.dart';
import 'package:flutter_front_end/widgets/layout_template/layout_template.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case StockListRoute:
      return _getPageRoute(StockList());
    case LayoutRoute:
      return _getPageRoute(LayoutTemplate());
    default:
      return _getPageRoute(StockList());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}
