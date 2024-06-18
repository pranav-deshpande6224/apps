import 'package:expense_tracker/Models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Models/category.dart';

final dateFormatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  final void Function(Expense expense) newExpense;
  const NewExpense(this.newExpense, {super.key});
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  MultipleCategory _selectedCategory = MultipleCategory.leisure;
  DateTime? datePicked;
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void presentDatePicker(BuildContext context) {
    final now = DateTime.now();
    showDatePicker(
            context: context,
            initialDate: now,
            firstDate: DateTime(now.year - 1, now.month, now.day),
            lastDate: now)
        .then((value) {
      setState(() {
        datePicked = value;
      });
    });
  }

  String getformattedDate(DateTime? dateTime) {
    return dateFormatter.format(dateTime!);
  }

  void _submittedExpenseData(BuildContext context) {
    // invalid amount then entered amount is null
    final enteredAmount = double.tryParse(_amountController.text);
    final isAmountInValid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        isAmountInValid ||
        datePicked == null) {
      // show alert box
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text("Invalid Details"),
              content: const Text(
                  'Please make sure enter proper Title or Amount or Date'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text('Okay'))
              ],
            );
          });
      return;
      // this if block get executed when there an error
    }

    widget.newExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        dateTime: datePicked!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(datePicked == null
                        ? 'No date Selected'
                        : getformattedDate(datePicked)),
                    IconButton(
                      onPressed: () => presentDatePicker(context),
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: MultipleCategory.values.map((element) {
                    return DropdownMenuItem(
                      value: element,
                      child: Text(
                        element.name.toUpperCase(),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => _submittedExpenseData(context),
                child: const Text('Save Expense'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
