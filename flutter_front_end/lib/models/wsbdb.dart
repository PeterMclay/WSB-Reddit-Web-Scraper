class WSBDb {
  Map stockMap;
  String totalComments;
  WSBDb({this.stockMap, this.totalComments});

  factory WSBDb.fromJson(Map<String, dynamic> map) {
    Map<String, dynamic> sortedMap = Map.fromEntries(
        map.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)));

    return WSBDb(
        stockMap: sortedMap,
        totalComments: sortedMap['comments_parsed'].toString());
  }
}

class Day5Total {
  Map stockMap;
  String totalComments;
  Day5Total({this.stockMap, this.totalComments});
  factory Day5Total.fromJson(Map<String, dynamic> map) {
    Map<String, dynamic> sortedMap = Map.fromEntries(
        map.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)));
    return Day5Total(
        stockMap: sortedMap,
        totalComments: sortedMap['comments_parsed'].toString());
  }
}
