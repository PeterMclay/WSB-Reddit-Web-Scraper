class StockMarketDb {
  Map stockMap;
  String totalComments;
  StockMarketDb({this.stockMap, this.totalComments});

  factory StockMarketDb.fromJson(Map<String, dynamic> map) {
    Map<String, dynamic> sortedMap = Map.fromEntries(
        map.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)));
    String commentsParsed = sortedMap['comments_parsed'].toString();
    sortedMap.remove('comments_parsed');
    sortedMap.remove('total_comments');
    return StockMarketDb(stockMap: sortedMap, totalComments: commentsParsed);
  }
}

class StockMarketDbTotal {
  Map stockMap;
  String totalComments;
  StockMarketDbTotal({this.stockMap, this.totalComments});
  factory StockMarketDbTotal.fromJson(Map<String, dynamic> map) {
    Map<String, dynamic> sortedMap = Map.fromEntries(
        map.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)));
    String commentsParsed = sortedMap['comments_parsed'].toString();
    sortedMap.remove('comments_parsed');
    sortedMap.remove('total_comments');
    return StockMarketDbTotal(
        stockMap: sortedMap, totalComments: commentsParsed);
  }
}
