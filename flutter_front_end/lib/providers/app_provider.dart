import 'package:flutter/material.dart';
import 'package:flutter_front_end/helpers/enumerators.dart';

class AppProvider with ChangeNotifier {
  DisplayedPage currentPage;

  AppProvider.init() {
    changeCurrentPage(DisplayedPage.HOME);
  }
  changeCurrentPage(DisplayedPage newPage) {
    currentPage = newPage;
    notifyListeners();
  }
}
