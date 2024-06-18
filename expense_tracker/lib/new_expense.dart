import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Models/category.dart';

final dateFormatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
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

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
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
            const SizedBox(height: 16,),
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
                    onPressed: () {
                      print(_titleController.text);
                      print(_amountController.text);
                    },
                    child: const Text('Save Expense'),
                  )
                ],
              ),
          ],
        ));
  }
}
