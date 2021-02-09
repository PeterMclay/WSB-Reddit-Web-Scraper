class StockMarketDb {
  Map stockMap;
  String totalComments;
  StockMarketDb({this.stockMap, this.totalComments});

  factory StockMarketDb.fromJson(Map<String, dynamic> map) {
    Map<String, dynamic> sortedMap = Map.fromEntries(
        map.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)));

    return StockMarketDb(
        stockMap: sortedMap,
        totalComments: sortedMap['comments_parsed'].toString());
  }
}

class StockMarketDbTotal {
  Map stockMap;
  String totalComments;
  StockMarketDbTotal({this.stockMap, this.totalComments});
  factory StockMarketDbTotal.fromJson(Map<String, dynamic> map) {
    Map<String, dynamic> sortedMap = Map.fromEntries(
        map.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)));
    return StockMarketDbTotal(
        stockMap: sortedMap,
        totalComments: sortedMap['comments_parsed'].toString());
  }
}
