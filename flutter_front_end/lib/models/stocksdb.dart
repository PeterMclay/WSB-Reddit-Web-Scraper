class StocksDb {
  Map stockMap;
  String totalComments;
  StocksDb({this.stockMap, this.totalComments});

  factory StocksDb.fromJson(Map<String, dynamic> map) {
    Map<String, dynamic> sortedMap = Map.fromEntries(
        map.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)));
    return StocksDb(
        stockMap: sortedMap, totalComments: sortedMap['GME'].toString());
  }
}

class StocksDbTotal {
  Map stockMap;
  String totalComments;
  StocksDbTotal({this.stockMap, this.totalComments});
  factory StocksDbTotal.fromJson(Map<String, dynamic> map) {
    Map<String, dynamic> sortedMap = Map.fromEntries(
        map.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)));
    return StocksDbTotal(
        stockMap: sortedMap,
        totalComments: sortedMap['comments_parsed'].toString());
  }
}
