class StocksDb {
  Map stockMap;
  String totalComments;
  StocksDb({this.stockMap, this.totalComments});

  factory StocksDb.fromJson(Map<String, dynamic> map) {
    Map<String, dynamic> sortedMap = Map.fromEntries(
        map.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)));
    String commentsParsed = sortedMap['comments_parsed'].toString();
    sortedMap.remove('comments_parsed');
    sortedMap.remove('total_comments');
    sortedMap.remove('RH');
    sortedMap.remove('EV');
    return StocksDb(stockMap: sortedMap, totalComments: commentsParsed);
  }
}

class StocksDbTotal {
  Map stockMap;
  String totalComments;
  StocksDbTotal({this.stockMap, this.totalComments});
  factory StocksDbTotal.fromJson(Map<String, dynamic> map) {
    Map<String, dynamic> sortedMap = Map.fromEntries(
        map.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)));
    String commentsParsed = sortedMap['comments_parsed'].toString();
    sortedMap.remove('comments_parsed');
    sortedMap.remove('total_comments');
    sortedMap.remove('RH');
    sortedMap.remove('EV');
    return StocksDbTotal(stockMap: sortedMap, totalComments: commentsParsed);
  }
}
