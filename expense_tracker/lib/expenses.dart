import 'package:flutter/material.dart';

class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Expense Tracker'),
            backgroundColor: Colors.blue,
          ),
          body: const Column(
            children: [
              Text('Chart'),
              Text('List'),
            ],
          )),
    );
  }
}
