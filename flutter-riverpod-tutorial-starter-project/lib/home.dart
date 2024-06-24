import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/main.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void onSubmit(WidgetRef ref, String name) {
    ref.read(userStateNotifierProvider.notifier).updateName(name);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProvider = ref.watch(userStateNotifierProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text(userProvider.name),
          elevation: 5,
        ),
        body: Column(
          children: [
            TextField(
              onSubmitted: (value) {
                onSubmit(ref, value);
              },
            ),
            Text(userProvider.age.toString())
          ],
        ));
  }
}
