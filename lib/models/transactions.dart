import 'package:flutter/foundation.dart';

class Transactions {
  String id;
  String Title;
  double amount;
  DateTime date;
  Transactions(
      {required this.id,
      required this.Title,
      required this.amount,
      required this.date});
}
