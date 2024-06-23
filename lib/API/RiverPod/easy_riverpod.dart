import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_dart/API/RiverPod/riverpod.dart';

class EasyRiverPod extends ConsumerWidget {
  const EasyRiverPod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Easy Riverpod version"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ref.watch(riverpodEasyLevel).toString(),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                ref.read(riverpodEasyLevel.notifier).state++;
              },
              icon: const Icon(Icons.add),
              label: const Text('ADD'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                ref.read(riverpodEasyLevel.notifier).state--;
              },
              icon: const Icon(Icons.remove),
              label: const Text('REMOVE'),
            ),
          ],
        ),
      ),
    );
  }
}
