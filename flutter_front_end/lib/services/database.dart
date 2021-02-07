import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_front_end/models/investingdb.dart';
import 'package:flutter_front_end/models/stockmarketdb.dart';
import 'package:flutter_front_end/models/stocksdb.dart';
import 'package:flutter_front_end/models/wsbdb.dart';

class Database {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

//Wall Street Bets
  Stream<WSBDb> streamWSB() {
    return _db
        .collection('wallstreetbets')
        .doc('day0')
        .snapshots()
        .map((event) => WSBDb.fromJson(event.data()));
  }

  Stream<Day5Total> streamDay5Total() {
    return _db
        .collection('wallstreetbets')
        .doc('day5total')
        .snapshots()
        .map((event) => Day5Total.fromJson(event.data()));
  }

//Stocks
  Stream<StocksDb> streamStocksDb() {
    return _db
        .collection('stocks')
        .doc('day0')
        .snapshots()
        .map((event) => StocksDb.fromJson(event.data()));
  }

  Stream<StocksDbTotal> streamStocksDbTotal() {
    return _db
        .collection('stocks')
        .doc('day5total')
        .snapshots()
        .map((event) => StocksDbTotal.fromJson(event.data()));
  }

//Investing
  Stream<InvestingDb> streamInvestingDb() {
    return _db
        .collection('investing')
        .doc('day0')
        .snapshots()
        .map((event) => InvestingDb.fromJson(event.data()));
  }

  Stream<InvestingDbTotal> streamInvestingDbTotal() {
    return _db
        .collection('investing')
        .doc('day5total')
        .snapshots()
        .map((event) => InvestingDbTotal.fromJson(event.data()));
  }

  //StockMarket
  Stream<StockMarketDb> streamStockMarketDb() {
    return _db
        .collection('StockMarket')
        .doc('day0')
        .snapshots()
        .map((event) => StockMarketDb.fromJson(event.data()));
  }

  Stream<StockMarketDbTotal> streamStockMarketDbTotal() {
    return _db
        .collection('StockMarket')
        .doc('day5total')
        .snapshots()
        .map((event) => StockMarketDbTotal.fromJson(event.data()));
  }
}
