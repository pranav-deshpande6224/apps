import 'package:expense_tracker/Widgets/expense_item.dart';
import 'package:flutter/material.dart';
import '../Models/expense.dart';

class ExpensesListview extends StatelessWidget {
  final List<Expense> userExpenses;
  const ExpensesListview({super.key, required this.userExpenses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: userExpenses.length,
        itemBuilder: (ctx, index) {
          return ExpenseItem(expenseObj: userExpenses[index]);
        });
  }
}
