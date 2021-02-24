class InvestingDb {
  Map stockMap;
  String totalComments;
  InvestingDb({this.stockMap, this.totalComments});

  factory InvestingDb.fromJson(Map<String, dynamic> map) {
    Map<String, dynamic> sortedMap = Map.fromEntries(
        map.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)));
    String commentsParsed = sortedMap['comments_parsed'].toString();
    sortedMap.remove('comments_parsed');
    sortedMap.remove('total_comments');
    sortedMap.remove('RH');
    sortedMap.remove('EV');
    return InvestingDb(stockMap: sortedMap, totalComments: commentsParsed);
  }
}

class InvestingDbTotal {
  Map stockMap;
  String totalComments;
  InvestingDbTotal({this.stockMap, this.totalComments});
  factory InvestingDbTotal.fromJson(Map<String, dynamic> map) {
    Map<String, dynamic> sortedMap = Map.fromEntries(
        map.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)));
    String commentsParsed = sortedMap['comments_parsed'].toString();
    sortedMap.remove('comments_parsed');
    sortedMap.remove('total_comments');
    sortedMap.remove('RH');
    sortedMap.remove('EV');
    return InvestingDbTotal(stockMap: sortedMap, totalComments: commentsParsed);
  }
}
