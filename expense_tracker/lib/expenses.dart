import 'package:expense_tracker/Widgets/expenses_listview.dart';
import 'package:expense_tracker/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/Models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> userRegisteredExpenses = [];

  void openModalOverlay(BuildContext context) {
    showModalBottomSheet(
        // modal overlay occupy entire space
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(_addExpense);
        });
  }

  void _addExpense(Expense expense) {
    setState(() {
      userRegisteredExpenses.add(expense);
    });
  }

  void _deleteExpense(Expense expense) {
    final index = userRegisteredExpenses.indexOf(expense);
    setState(() {
      userRegisteredExpenses.remove(expense);
    });
    // Here context using is the global context
    // if undo is pressed then it is added then again is added to the list and
    // show in the UI
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: const Text('Your Item Deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              userRegisteredExpenses.insert(
                index,
                expense,
              );
            });
          },
        ),
      ),
    );
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
      body: userRegisteredExpenses.isEmpty
          ? const Center(
              child: Text(
                'Please Add Your Expenses',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : Column(
              children: [
                const Text('Chart'),
                Expanded(
                  child: ExpensesListview(
                    userExpenses: userRegisteredExpenses,
                    removeItem: _deleteExpense,
                  ),
                ),
              ],
            ),
    );
  }
}
