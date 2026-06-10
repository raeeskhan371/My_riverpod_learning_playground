import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/provider/counter_provider.dart';

// this is example of stateProvider
class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Full UI rebuild Time ");

    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Consumer(
                builder: (context, ref, child) {
                  print("Only Text Widget rebuild");
                  final counter = ref.watch(counterProvider);

                  return Center(
                    child: Text(
                      "Counter: $counter",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print("Incremanet Button rebuild");
                      ref.read(counterProvider.notifier).state++;
                    },
                    child: Text("Increment +"),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      print("decremanet Button rebuild");
                      ref.read(counterProvider.notifier).state--;
                    },
                    child: Text("decrement -"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
