import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_front_end/models/wsbdb.dart';

class Database {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<WSBDb> streamWSB() {
    return _db
        .collection('WSB')
        .doc('day0')
        .snapshots()
        .map((event) => WSBDb.fromJson(event.data()));
  }

  Stream<Day5Total> streamDay5Total() {
    return _db
        .collection('WSB')
        .doc('day5total')
        .snapshots()
        .map((event) => Day5Total.fromJson(event.data()));
  }
}
