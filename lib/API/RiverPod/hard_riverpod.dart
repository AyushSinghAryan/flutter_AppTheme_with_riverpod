import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_dart/API/RiverPod/riverpod.dart';

class HardRiverPod extends ConsumerWidget {
  const HardRiverPod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hard Riverpod version"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ref.watch(riverpodHardLevel).counter.toString(),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                ref.read(riverpodHardLevel).addCounter();
              },
              icon: const Icon(Icons.add),
              label: const Text('ADD'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                ref.read(riverpodHardLevel).removeCounter();
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
