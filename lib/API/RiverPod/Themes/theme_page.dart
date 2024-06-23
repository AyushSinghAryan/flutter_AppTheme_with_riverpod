import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_dart/API/RiverPod/riverpod.dart';

class ThemePage extends ConsumerWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("T H E M E M O D E "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                ref.read(riverpodTheme).newLightTheme();
                // ref.watch(riverpodTheme).currentTheme
              },
              icon: const Icon(Icons.light_mode),
              label: const Text('LIGHT'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context)
                    .elevatedButtonTheme
                    .style
                    ?.foregroundColor
                    ?.resolve({}),
                backgroundColor: Theme.of(context)
                    .elevatedButtonTheme
                    .style
                    ?.backgroundColor
                    ?.resolve({}),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                ref.read(riverpodTheme).newDarkTheme();
              },
              icon: const Icon(Icons.dark_mode),
              label: const Text('DARK'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context)
                    .elevatedButtonTheme
                    .style
                    ?.foregroundColor
                    ?.resolve({}),
                backgroundColor: Theme.of(context)
                    .elevatedButtonTheme
                    .style
                    ?.backgroundColor
                    ?.resolve(
                        {}), //Returns a value of type T that depends on [states].
              ),
            ),
          ],
        ),
      ),
    );
  }
}
