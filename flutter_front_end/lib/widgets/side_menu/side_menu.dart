import 'package:flutter/material.dart';
import 'package:flutter_front_end/helpers/enumerators.dart';
import 'package:flutter_front_end/locator.dart';
import 'package:flutter_front_end/providers/app_provider.dart';
import 'package:flutter_front_end/routing/route_names.dart';
import 'package:flutter_front_end/services/navigation_service.dart';
import 'package:flutter_front_end/widgets/side_menu/side_menu_item.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppProvider appProvider = Provider.of<AppProvider>(context);
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.grey[200], offset: Offset(3, 5), blurRadius: 17)
      ]),
      width: 200,
      foregroundDecoration: BoxDecoration(
        color: null,
        boxShadow: null,
        gradient: null,
        border: null,
        borderRadius: null,
        backgroundBlendMode: null,
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('StockScraper'),
            Column(
              children: [
                SideMenuItemDesktop(
                  active: appProvider.currentPage == DisplayedPage.HOME,
                  text: 'r/wallstreetbets',
                  imageName: 'images/wsb.png',
                  onTap: () {
                    appProvider.changeCurrentPage(DisplayedPage.HOME);
                    locator<NavigationService>().navigateTo(StockListRoute);
                  },
                ),
                SideMenuItemDesktop(
                  active: appProvider.currentPage == DisplayedPage.PRODUCTS,
                  text: 'r/stocks',
                  imageName: 'images/stocks.png',
                  onTap: () {
                    appProvider.changeCurrentPage(DisplayedPage.PRODUCTS);
                    locator<NavigationService>().navigateTo(StockListRoute);
                  },
                ),
                SideMenuItemDesktop(
                  active: appProvider.currentPage == DisplayedPage.USERS,
                  text: 'r/investing',
                  imageName: 'images/stonks.png',
                  onTap: () {
                    appProvider.changeCurrentPage(DisplayedPage.USERS);
                    locator<NavigationService>().navigateTo(StockListRoute);
                  },
                ),
                SideMenuItemDesktop(
                  active: appProvider.currentPage == DisplayedPage.PRODUCTS,
                  text: 'r/StockMarket',
                  imageName: 'images/StockMarket.png',
                  onTap: () {
                    appProvider.changeCurrentPage(DisplayedPage.PRODUCTS);
                    locator<NavigationService>().navigateTo(StockListRoute);
                  },
                ),
                SideMenuItemDesktop(
                  active: appProvider.currentPage == DisplayedPage.USERS,
                  text: 'r/Daytrading',
                  imageName: 'images/Daytrading.png',
                  onTap: () {
                    appProvider.changeCurrentPage(DisplayedPage.USERS);
                    locator<NavigationService>().navigateTo(StockListRoute);
                  },
                ),
              ],
            ),
            SideMenuItemDesktop(
              active: appProvider.currentPage == DisplayedPage.USERS,
              text: 'About',
              imageName: 'images/pete_sauce.png',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
