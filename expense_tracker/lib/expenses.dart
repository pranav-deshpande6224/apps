import 'package:expense_tracker/Widgets/expenses_listview.dart';
import 'package:expense_tracker/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/Models/expense.dart';
import 'Models/category.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> userRegisteredExpenses = [
    Expense(
      title: "To Hyderabad",
      amount: 7000,
      dateTime: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: "outing",
      amount: 2000,
      dateTime: DateTime.now(),
      category: Category.food,
    )
  ];
  void openModalOverlay(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return const NewExpense();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Flutter Expense Tracker',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {
              openModalOverlay(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpensesListview(
              userExpenses: userRegisteredExpenses,
            ),
          ),
        ],
      ),
    );
  }
}
