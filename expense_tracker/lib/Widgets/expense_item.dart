import 'package:expense_tracker/Models/expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/Models/category.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expenseObj;
  const ExpenseItem({super.key, required this.expenseObj});
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(expenseObj.title),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text('\$ ${expenseObj.amount}'),
              const SizedBox(
                width: 10,
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(categoryIcons[expenseObj.category]),
                  const SizedBox(width: 8),
                  Text(expenseObj.formattedDate)
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
