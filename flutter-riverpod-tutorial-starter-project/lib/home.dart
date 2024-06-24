import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/main.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void onSubmitName(WidgetRef ref, String name) {
    ref.read(userStateNotifierProvider.notifier).updateName(name);
  }

  void onSubmitAge(WidgetRef ref, String age) {
    ref.read(userStateNotifierProvider.notifier).updateAge(int.parse(age));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProvider = ref.watch(userStateNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(userProvider.name),
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onSubmitted: (value) {
                onSubmitName(ref, value);
              },
            ),
            TextField(
              onSubmitted: (value) {
                onSubmitAge(ref, value);
              },
            ),
            Text(userProvider.age.toString()),
            Text(userProvider.name)
          ],
        ),
      ),
    );
  }
}
