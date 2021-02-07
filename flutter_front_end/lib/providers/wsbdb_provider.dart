import 'package:flutter/material.dart';
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

  Map get stockMap => _stockMap;
  Stream<Day5Total> get entries => db.streamDay5Total();
}
