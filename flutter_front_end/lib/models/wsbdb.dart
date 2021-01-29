class WSBDb {
  Map stockMap;
  WSBDb({this.stockMap});

  factory WSBDb.fromJson(Map<String, dynamic> map) {
    Map<String, dynamic> sortedMap = Map.fromEntries(
        map.entries.toList()..sort((e1, e2) => e2.value.compareTo(e1.value)));
    return WSBDb(stockMap: sortedMap);
  }
}
