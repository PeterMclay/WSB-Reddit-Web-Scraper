import 'package:flutter/material.dart';
import 'package:flutter_front_end/models/investingdb.dart';
import 'package:flutter_front_end/models/stockmarketdb.dart';
import 'package:flutter_front_end/models/stocksdb.dart';
import 'package:flutter_front_end/services/database.dart';
import 'package:flutter_front_end/models/wsbdb.dart';

class WSBDbProvider with ChangeNotifier {
  final db = Database();
  Map _stockMap;
  String _totalComments;

  Map get stockMap => _stockMap;
  String get totalComments => _totalComments;
  Stream<WSBDb> get entries => db.streamWSB();
}

class Day5Provider with ChangeNotifier {
  final db = Database();
  Map _stockMap;
  String _totalComments;
  Map get stockMap => _stockMap;
  String get totalComments => _totalComments;
  Stream<Day5Total> get entries => db.streamDay5Total();
}

//Stocks
class StocksDbProvider with ChangeNotifier {
  final db = Database();
  Map _stockMap;
  String _totalComments;

  Map get stockMap => _stockMap;
  String get totalComments => _totalComments;
  Stream<StocksDb> get entries => db.streamStocksDb();
}

class StocksDbTotalProvider with ChangeNotifier {
  final db = Database();
  Map _stockMap;
  String _totalComments;
  Map get stockMap => _stockMap;
  String get totalComments => _totalComments;
  Stream<StocksDbTotal> get entries => db.streamStocksDbTotal();
}

//Investing
class InvestingDbProvider with ChangeNotifier {
  final db = Database();
  Map _stockMap;
  String _totalComments;

  Map get stockMap => _stockMap;
  String get totalComments => _totalComments;
  Stream<InvestingDb> get entries => db.streamInvestingDb();
}

class InvestingDbTotalProvider with ChangeNotifier {
  final db = Database();
  Map _stockMap;
  String _totalComments;
  Map get stockMap => _stockMap;
  String get totalComments => _totalComments;
  Stream<InvestingDbTotal> get entries => db.streamInvestingDbTotal();
}

//StockMarket
class StockMarketDbProvider with ChangeNotifier {
  final db = Database();
  Map _stockMap;
  String _totalComments;

  Map get stockMap => _stockMap;
  String get totalComments => _totalComments;
  Stream<StockMarketDb> get entries => db.streamStockMarketDb();
}

class StockMarketDbTotalProvider with ChangeNotifier {
  final db = Database();
  Map _stockMap;
  String _totalComments;
  Map get stockMap => _stockMap;
  String get totalComments => _totalComments;
  Stream<StockMarketDbTotal> get entries => db.streamStockMarketDbTotal();
}
