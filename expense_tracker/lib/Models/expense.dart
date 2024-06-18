import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Expense {
  final String id; // id is used to delete the expense
  final String title;
  final double amount;
  final DateTime dateTime;
  final Category category;
  Expense({
    required this.title,
    required this.amount,
    required this.dateTime,
    required this.category
  }) : id = uuid.v4();
}

// to generate the Unique id for each of the expense
// here using the UUID package 
// imported from the pub.dev

