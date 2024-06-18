import 'package:uuid/uuid.dart';
import 'package:expense_tracker/Models/category.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
final dateFormatter = DateFormat.yMd();

const Map<MultipleCategory, IconData> categoryIcons = {
  MultipleCategory.food: Icons.lunch_dining,
  MultipleCategory.leisure: Icons.movie,
  MultipleCategory.travel: Icons.flight,
  MultipleCategory.work: Icons.work
};

class Expense {
  final String id; // id is used to delete the expense
  final String title;
  final double amount;
  final DateTime dateTime;
  final MultipleCategory category;
  Expense(
      {required this.title,
      required this.amount,
      required this.dateTime,
      required this.category})
      : id = uuid.v4();

  String get formattedDate {
    return dateFormatter.format(dateTime);
  }
}

// to generate the Unique id for each of the expense
// here using the UUID package 
// imported from the pub.dev

