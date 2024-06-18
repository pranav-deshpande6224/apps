import 'package:expense_tracker/Widgets/expense_item.dart';
import 'package:flutter/material.dart';
import '../Models/expense.dart';

class ExpensesListview extends StatelessWidget {
  final List<Expense> userExpenses;
  final void Function(Expense expense) removeItem;
  const ExpensesListview(
      {super.key, required this.userExpenses, required this.removeItem});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userExpenses.length,
      itemBuilder: (ctx, index) {
        return Dismissible(
          // here every object is its own key to identify uniquely
          key: ValueKey(userExpenses[index]),
          onDismissed: (direction) {
            removeItem(userExpenses[index]);
          },
          child: ExpenseItem(
            expenseObj: userExpenses[index],
          ),
        );
      },
    );
  }
}
