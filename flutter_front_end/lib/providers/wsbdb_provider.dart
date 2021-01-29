import 'package:flutter/material.dart';
import 'package:flutter_front_end/services/database.dart';
import 'package:flutter_front_end/models/wsbdb.dart';

class WSBDbProvider with ChangeNotifier {
  final db = Database();
  Map _stockMap;

  Map get stockMap => _stockMap;
  Stream<WSBDb> get entries => db.streamWSB();
}
