import 'package:flutter/material.dart';
import 'package:section11/Data/dummy_categories.dart';
import 'package:section11/Models/category.dart';
import 'package:section11/Models/grocery_item.dart';

// when handling the form or handling the textfield
// please go with stateful widget
// for the ListView, grid view
// we can go with stateless widget

class GroceryNewItemScreen extends StatefulWidget {
  const GroceryNewItemScreen({super.key});
  @override
  State<GroceryNewItemScreen> createState() {
    return _GroceryNewItemScreenState();
  }
}

class _GroceryNewItemScreenState extends State<GroceryNewItemScreen> {
  final _key = GlobalKey<FormState>();
  var _enteredName = '';
  var _quantity = 1;
  var _initialItem = dummyCategories[Categories.vegetable];
  void _saveData() {
    final value = _key.currentState!.validate();
    if (!value) return;
    _key.currentState!.save();
    Navigator.of(context).pop(GroceryItem(
      id: DateTime.now().toString(),
      name: _enteredName,
      quantity: _quantity,
      category: _initialItem!,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(label: Text('Name')),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'it should not be empty';
                  }

                  if (value.trim().length == 1) {
                    return 'Input should be atleast 2 char';
                  }

                  if (value.trim().length > 50) {
                    return 'Input should be less than 50 char';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(label: Text('Quantity')),
                      initialValue: '1',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Quantity should not be empty';
                        }
                        if (int.tryParse(value) == null) {
                          return 'please enter int not string';
                        }
                        if (int.tryParse(value)! <= 0) {
                          return 'quantity can\'t be 0';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _quantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                        value: _initialItem,
                        items: [
                          for (final category in dummyCategories.entries)
                            DropdownMenuItem(
                                value: category.value,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 16,
                                      width: 16,
                                      color: category.value.color,
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(category.value.title)
                                  ],
                                ))
                        ],
                        onChanged: (value) {
                          // value can't be null
                          // to update the UI
                          // the form will never get updated because of the key
                          setState(() {
                            _initialItem = value!;
                          });
                        }),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        _key.currentState!.reset();
                      },
                      child: const Text('Reset')),
                  ElevatedButton(
                      onPressed: _saveData, child: const Text('Add Item'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
